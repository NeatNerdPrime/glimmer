require 'set'

require_relative 'observer'
require_relative 'block_observer'

module ObservableModel
  class Updater
    include Observer
    def initialize(observable_model, property_name)
      @observable_model = observable_model
      @property_name = property_name
    end
    def update(changed_value=nil)
      @observable_model.notify_observers(@property_name)
    end
  end

  # Takes observer as an object or a block updater
  def add_observer(property_name, observer = nil, &updater)
    observer ||= BlockObserver.new(&updater)
    return observer if has_observer?(property_name, observer)
    property_observer_list(property_name) << observer
    add_property_writer_observers(property_name)
    observer.register(self, property_name)
    observer
  end

  def remove_observer(property_name, observer = nil)
    property_observer_list(property_name).delete(observer)
  end

  def has_observer?(property_name, observer)
    property_observer_list(property_name).include?(observer)
  end

  def has_observer_for_any_property?(observer)
    property_observer_hash.values.map(&:to_a).sum.include?(observer)
  end

  def property_observer_hash
    @property_observers = Hash.new unless @property_observers
    @property_observers
  end

  def property_observer_list(property_name)
    property_observer_hash[property_name.to_sym] = Set.new unless property_observer_hash[property_name.to_sym]
    property_observer_hash[property_name.to_sym]
  end

  def notify_observers(property_name)
    property_observer_list(property_name).each {|observer| observer.update(send(property_name))}
  end
  #TODO upon updating values, make sure dependent observers are cleared (not added as dependents here)

  def add_property_writer_observers(property_name)
    property_writer_name = "#{property_name}="
    ensure_array_object_observer(property_name, send(property_name))
    begin
      method("__original_#{property_writer_name}")
    rescue
      instance_eval "alias __original_#{property_writer_name} #{property_writer_name}"
      instance_eval <<-end_eval, __FILE__, __LINE__
        def #{property_writer_name}(value)
          old_value = self.#{property_name}
          self.__original_#{property_writer_name}(value)
          notify_observers('#{property_name}')
          ensure_array_object_observer('#{property_name}', value, old_value)
        end
      end_eval
    end
  end

  def ensure_array_object_observer(property_name, object, old_object = nil)
    return unless object.is_a?(Array)
    object.extend(ObservableArray) unless object.is_a?(ObservableArray)
    array_object_observer = array_object_observer_for(property_name)
    object.add_array_observer(array_object_observer)
    property_observer_list(property_name).each do |observer|
      observer.add_dependent([self, property_name] => [array_object_observer, object, nil])
    end
    array_object_observer_for(property_name).unregister(old_object) if old_object.is_a?(ObservableArray)
  end

  def array_object_observer_for(property_name)
    @array_object_observers ||= {}
    unless @array_object_observers.has_key?(property_name)
      @array_object_observers[property_name] = ObservableModel::Updater.new(self, property_name)
    end
    @array_object_observers[property_name]
  end
end
