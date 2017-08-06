require "spec_helper"

describe "Glimmer Listeners" do
  include Glimmer

	include_package 'org.eclipse.swt'
	include_package 'org.eclipse.swt.widgets'
	include_package 'org.eclipse.swt.layout'

  before do
    dsl :swt
  end

	after do
  	@target.display.dispose if @target.display
	end

  class Person
    attr_accessor :name, :age, :adult
  end

  it "tests text widget verify listener" do
    @target = shell {
      composite {
        @text = text {
          text "Howdy"
          on_verify_text do |verify_event|
            verify_event.doit = false if verify_event.text == "Hello"
          end
        }
      }
    }

    @text.widget.setText("Hi")
    expect(@text.widget.getText).to eq("Hi")

    @text.widget.setText("Hello")
    expect(@text.widget.getText).to eq("Hi")
  end

  def test_button_widget_selection_listener
    person = Person.new
    person.name = "Bruce Ting"

    @target = shell {
      composite {
        @button = button {
          on_widget_selected do
            person.name = "Bruce Lao"
          end
        }
      }
    }
    expect(person.name).to eq("Bruce Ting")
    @button.widget.setSelection(true)
    @button.widget.notifyListeners(SWT::Selection, nil)
    expect(person.name).to eq("Bruce Lao")
  end

end