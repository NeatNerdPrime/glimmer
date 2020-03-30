require 'set'

module Glimmer
  module SWT
    # Mixin representing Observer trait from Observer Design Pattern
    # Allows classes to include without interfering with their
    # inheritance hierarchy.
    #
    # Includes a default implementation that can receive an observer block
    # Example: Observer.proc {|new_value| puts new_value}
    # Subclasses may override
    module Observer
      # Observer Proc default implementation that takes an observer block to process updates
      # via call method
      class Proc
        include Observer

        def initialize(&observer_block)
          @observer_block = observer_block
        end

        # Called by observables once updates occur sending in the new_value if any
        def call(new_value=nil)
          @observer_block.call(new_value)
        end
      end

      class << self
        def proc(&observer_block)
          Proc.new(&observer_block)
        end
      end

      def registrations
        @registrations ||= Set.new
      end

      def registrations_for(observable, property = nil)
        registrations.select {|o, p| o == observable && p == property}
      end

      # mapping of registrations to dependents
      # {[observable, property] => [[dependent, dependent_observable, dependent_property], ...]}
      def dependents
        @dependents ||= Hash.new
      end

      def dependents_for(registration)
        dependents[registration] ||= Set.new
      end

      # registers observer in an observable on a property (optional)
      # observer maintains registration list to unregister later
      def register(observable, property = nil)
        # pd property, announcer: '[OBSERVE]', header: true
        # pd observable, announcer: '[OBSERVE]'
        # pd self, announcer: '[OBSERVE]'
        unless observable.is_a?(Observable)
          # pd 'not an observable'
          # TODO refactor code to be more smart/polymorphic/automated and honor open/closed principle
          if observable.is_a?(Array)
            # pd 'array'
            observable.extend(ObservableArray)
          else
            # pd 'not array'
            observable.extend(ObservableModel)
          end
        end
        # pd 'adding observer', announcer: '[OBSERVE]'
        # pd [self, property], announcer: '[OBSERVE]'
        observable.add_observer(*[self, property].compact)
        # pd 'adding registration', announcer: '[OBSERVE]'
        [observable, property].tap do |registration|
          self.registrations << registration
        end
      end
      alias observe register

      def unregister(observable, property = nil)
        observable.remove_observer(*[self, property].compact)
        registration = [observable, property]
        dependents_for(registration).each do |dependent|
          dependent_observer, dependent_observable, dependent_property = dependent
          dependent_observer.unregister(dependent_observable, dependent_property)
          remove_dependent(registration => dependent)
        end
        registrations.delete(registration)
      end
      alias unobserve unregister

      def unregister_dependents_with_observable(registration, dependent_observable)
        thedependents = dependents_for(registration).select do |d_observer, d_observable, d_property|
          d_observable == dependent_observable
        end
        thedependents.each do |d_observer, d_observable, d_property|
          d_observer.unregister(d_observable, d_property)
        end
      end

      # cleans up all registrations in observables
      def unregister_all_observables
        registrations.each do |observable, property|
          unregister(observable, property)
        end
      end
      alias unobserve_all_observables unregister_all_observables

      # add dependent observer to unregister when unregistering observer
      def add_dependent(parent_to_dependent_hash)
        observable, property = registration = parent_to_dependent_hash.keys.first
        dependent_observer, dependent_observable, dependent_property = dependent = parent_to_dependent_hash.values.first
        dependents_for(registration) << dependent
      end

      def remove_dependent(parent_to_dependent_hash)
        observable, property = registration = parent_to_dependent_hash.keys.first
        dependent_observer, dependent_observable, dependent_property = dependent = parent_to_dependent_hash.values.first
        dependents_for(registration).delete(dependent)
      end

      def call(new_value)
        raise 'Not implemented!'
      end
    end
  end
end
