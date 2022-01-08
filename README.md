# [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=85 style="position: relative; top: 20px;" />](https://rubygems.org/gems/glimmer) Glimmer - DSL Framework for Ruby GUI and More
[![Gem Version](https://badge.fury.io/rb/glimmer.svg)](http://badge.fury.io/rb/glimmer)
[![rspec](https://github.com/AndyObtiva/glimmer/workflows/rspec/badge.svg)](https://github.com/AndyObtiva/glimmer/actions?query=workflow%3Arspec)
[![Coverage Status](https://coveralls.io/repos/github/AndyObtiva/glimmer/badge.svg?branch=master)](https://coveralls.io/github/AndyObtiva/glimmer?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/38fbc278022862794414/maintainability)](https://codeclimate.com/github/AndyObtiva/glimmer/maintainability)
[![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

**[Contributors Wanted! (Submit a Glimmer App Sample to Get Started)](#contributing)**

**(The Original Glimmer Library Handling the World’s Ruby GUI Needs Since 2007. Beware of Imitators!)**

[**Glimmer**](https://rubygems.org/gems/glimmer) started out as a [GUI Library](https://github.com/AndyObtiva/glimmer-dsl-swt) and grew into a full-fledged [DSL Framework](#dsl-engine) with support for multiple GUI DSLs. Glimmer's namesake is referring to the Glimmer of Ruby in Graphical User Interfaces (contrary to [popular myth](http://blog.headius.com/2007/11/tab-sweep.html) perpetrated by [Charles Nutter](http://blog.headius.com/2007/11/tab-sweep.html), Glimmer has nothing to do with the ill-fated Whitney Houston movie, which does not in fact share the same name)

[<img src="https://covers.oreillystatic.com/images/9780596519650/lrg.jpg" width=105 /><br />
Featured in JRuby Cookbook](http://shop.oreilly.com/product/9780596519650.do) and [Chalmers/Gothenburg University Software Engineering Master's Lecture Material](http://www.cse.chalmers.se/~bergert/slides/guest_lecture_DSLs.pdf)

[**Glimmer**](https://rubygems.org/gems/glimmer) is a DSL (Domain-Specific Language) Framework that consists of two things:
- [DSL Engine](#dsl-engine): enables building internal DSLs embedded in Ruby (e.g. for GUI, XML, or CSS).
- [Data-Binding Library](#data-binding-library): enables synchronizing GUI with Model Attributes bidirectionally **(now with [Shine](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#shine) syntax support in v2)**.

[**Glimmer**](https://rubygems.org/gems/glimmer) is ***the cream of the crop*** when it comes to building DSLs in Ruby:
- Supports building the tersest most concise domain specific language syntax in Ruby.
- Maximum readability and maintainability.
- No extra unnecessary block variables when not needed.
- DSL Blocks are true Ruby closures that can conveniently leverage variables from the outside and utilize standard Ruby code in and around. Just code in Ruby as usual and be happy! No surprising restrictions or strange uses of `instance_exec`/`eval`.
- DSL syntax is limited to classes that mixin the `Glimmer` module, so the rest of the code is fully safe from namespace pollution.
- Multiple DSLs may be [mixed](#multi-dsl-support) together safely to achieve maximum expressability, composability, and productivity.
- DSLs are fully configurable, so you may activate and deactivate DSLs as per your current needs only.

Start by checking out Glimmer's original GUI DSL (for [JRuby](https://www.jruby.org/)), which got extracted into its own gem (100% complete); [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt), and Glimmer's CRuby GUI DSL (100% complete), which has no prerequisites beyond installing the Ruby gem; [Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui).

[**Glimmer**](https://rubygems.org/gems/glimmer) supports the following DSLs:
- [glimmer-dsl-swt](https://github.com/AndyObtiva/glimmer-dsl-swt): Glimmer DSL for SWT (JRuby Desktop Development GUI Framework)
- [glimmer-dsl-opal](https://github.com/AndyObtiva/glimmer-dsl-opal): Glimmer DSL for Opal (Pure Ruby Web GUI and Auto-Webifier of Desktop Apps)
- [glimmer-dsl-tk](https://github.com/AndyObtiva/glimmer-dsl-tk): Glimmer DSL for Tk (MRI Ruby Desktop Development GUI Library)
- [glimmer-dsl-libui](https://github.com/AndyObtiva/glimmer-dsl-libui): Glimmer DSL for LibUI (Prerequisite-Free Ruby Desktop Development GUI Library)
- [glimmer-dsl-gtk](https://github.com/AndyObtiva/glimmer-dsl-gtk): Glimmer DSL for GTK (Ruby-GNOME Desktop Development GUI Library)
- [glimmer-dsl-xml](https://github.com/AndyObtiva/glimmer-dsl-xml): Glimmer DSL for XML (& HTML)
- [glimmer-dsl-css](https://github.com/AndyObtiva/glimmer-dsl-css): Glimmer DSL for CSS

## Table of Contents

- [Glimmer](#-glimmer---dsl-framework-for-ruby-gui-and-more)
  - [DSL Engine](#dsl-engine)
    - [Setup](#setup)
    - [Configuration](#configuration)
    - [Multi-DSL Support](#multi-dsl-support)
    - [Official DSLs](#official-dsls)
      - [Glimmer DSL for SWT (JRuby Desktop Development GUI Framework)](#glimmer-dsl-for-swt-jruby-desktop-development-gui-framework)
      - [Glimmer DSL for Opal (Pure Ruby Web GUI and Auto-Webifier of Desktop Apps)](#glimmer-dsl-for-opal-pure-ruby-web-gui-and-auto-webifier-of-desktop-apps)
      - [Glimmer DSL for Tk (MRI Ruby Desktop Development GUI Library)](#glimmer-dsl-for-tk-mri-ruby-desktop-development-gui-library)
      - [Glimmer DSL for LibUI (Prerequisite-Free Ruby Desktop Development GUI Library)](#glimmer-dsl-for-libui-prerequisite-free-ruby-desktop-development-gui-library)
      - [Glimmer DSL for XML (& HTML)](#glimmer-dsl-for-xml--html)
      - [Glimmer DSL for CSS](#glimmer-dsl-for-css)
  - [Data-Binding Library](#data-binding-library)
  - [Glimmer Process](#glimmer-process)
  - [Resources](#resources)
  - [Help](#help)
    - [Issues](#issues)
    - [Chat](#chat)
  - [Feature Suggestions](#feature-suggestions)
  - [Change Log](#change-log)
  - [Contributing](#contributing)
  - [Contributors](#contributors)
  - [Hire Me](#hire-me)
  - [License](#license)

## DSL Engine

Glimmer is fundamentally a DSL Engine that can support any number of DSLs like the official Glimmer DSLs (gems starting with the `glimmer-dsl-` prefix like `glimmer-dsl-swt`) or any DSLs for that matter.

Glimmer DSL syntax consists mainly of:
- **keywords** (e.g. `table` for a table widget)
- **style/args** (e.g. :multi as in `table(:multi)` for a multi-line selection table widget)
- **content (nested attributes/keywords)** (e.g. `{ table_column { text 'Name'} }` as in `table(:multi) { table_column { text 'Name'} }` for a multi-line selection table widget with a table column having header text property `'Name'` as content)

Here is a Hello, World! example from [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt):

```ruby
include Glimmer

shell(:no_resize) { # keyword + style arg
  text "Glimmer" # attribute content
  
  label { # keyword content
    text "Hello, World!" # attribute content
  }
}.open
```

That code renders the following GUI (Graphical User Interface):

![Hello World](images/glimmer-hello-world.png)

The Glimmer DSL Engine's architecture is based on the following Design Patterns and Data Structures:
- **Interpreter Design Pattern**: to define interpretable expressions of DSL keywords
- **Chain of Responsibility Design Pattern / Queue Data Structure**: to chain expression handlers in order of importance for processing DSL keywords
- **Adapter Design Pattern**: to adapt expressions into handlers in a chain of responsibility
- **Stack Data Structure**: to handle processing parent/child nesting of DSL keyword expressions in the correct order
- **Proxy Design Pattern**: to shield consumers of GUI libraries built with Glimmer from low-level GUI widget details

Glimmer's use of the **Interpreter Design Pattern** in processing DSLs is also known as the **Virtual Machine Architectural Style**. After all, DSL expressions are virtual machine opcodes that process nested keywords stored in a stack. I built Glimmer's original DSL back in 2007 without knowing the **Virtual Machine Architectural Style** (except perhaps as an esoteric technology powering Java), but stumbled upon it anyways through following the Gang of Four Design Patterns mentioned above, chiefly the **Interpreter Design Pattern** and the **Chain of Responsibility Design Pattern**.

Every keyword in a Glimmer DSL is represented by a DSL expression that is processed by an `Expression` subclass selected from a chain of expressions (interpreters) pre-configured in a DSL chain of responsibility via `Glimmer::DSL::Engine.add_dynamic_expressions(DSLNameModule, expression_names_array)`.

Expressions are either:
- **Static** (subclass of `StaticExpression`, which is a subclass of `Expression`): if they represent a single pre-identified keyword (e.g. `color` or `display`)
- **Dynamic** (subclass of `Expression`): if they represent keywords calculated on the fly during processing (e.g. an SWT widget like `label` or a random XML element called `folder` representing `<folder></folder>`)

Optionally, expressions can be parent expressions that contain other expressions, and must include the `ParentExpression` mixin module as such.

Additionally, every expression that serves as a top-level entry point into the DSL must mixin `TopLevelExpression`

Static expressions are optimized in performance since they pre-define methods on the `Glimmer` module matching the static keywords they represent (e.g. `color` causes creating a `Glimmer#color` method for processing `color` expressions) and completely bypass as a result the Glimmer DSL Engine Chain of Responsibility. That said, they must be avoided if the same keyword might occur multiple times, but with different requirements for arguments, block, and parenthood type.

Every `Expression` sublcass must specify two methods at least:
- `can_interpret?(parent, keyword, *args, &block)`: to quickly test if the keyword and arg/block/parent combination qualifies for interpretation by the current `Expression` or to otherwise delegate to the next expression in the chain of responsibility.
- `interpret(parent, keyword, *args, &block)`: to go ahead and interpret a DSL expression that qualified for interpretation

`StaticExpression` sublcasses may skip the `can_interpret?` method since they include a default implementation for it that matches the name of the keyword from the class name by convention. For example, a `color` keyword would have a `ColorExpression` class, so `color` is inferred automatically from class name and used in deciding whether the class can handle a `color` keyword or not.

`ParentExpression` subclasses can optionally override this extra method, which is included by default and simply invokes the parent's passed block to process its children:
- `add_content(parent, keyword, *args, &block)`

For example, some parent widgets use their block for other reasons or process their children at very specific times, so they may override that method and disable it, or otherwise call `super` and do additional work.

Otherwise, all expressions support the `around` hook method:
- `around(parent, keyword, args, block, &interpret_and_add_content)`: a hook for executing code around both `interpret` and `add_content`. Clients may invoke `interpret_and_add_content.call` or `yield` when ready for interpretation. `parent`, `keyword`, `args`, and `block` are supplied in case they are needed in the `around` logic.

Example of a dynamic expression:

```ruby
module Glimmer
  module DSL
    module SWT
      class WidgetExpression < Expression
        include ParentExpression

        EXCLUDED_KEYWORDS = %w[shell display tab_item]

        def can_interpret?(parent, keyword, *args, &block)
          !EXCLUDED_KEYWORDS.include?(keyword) and
            parent.respond_to?(:swt_widget) and
            Glimmer::SWT::WidgetProxy.widget_exists?(keyword)
        end

        def interpret(parent, keyword, *args, &block)
          Glimmer::SWT::WidgetProxy.create(keyword, parent, args)
        end

        def add_content(parent, keyword, *args, &block)
          super
          parent.post_add_content
        end

      end
    end
  end
end
```

Example of a static expression (does not need `can_interpret?`):

```ruby
module Glimmer
  module DSL
    module Opal
      class ColorExpression < StaticExpression
        include TopLevelExpression
  
        def interpret(parent, keyword, *args, &block)
          Glimmer::SWT::ColorProxy.new(*args)
        end
      end
    end
  end
end
```

An extra convenience expression module is included called `BindExpression`. It builds a `Glimmer::DataBinding::ModelBinding` object for [data-binding](#data-binding) purposes.
Another convenience expression module is `ObserveExpression`, which enables a one-way `observe` operation.
You may learn more about both by looking at how [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) uses them.

DSL expressions go into the `glimmer/dsl/{dsl_name}` namespace directory.

Also, every DSL requires a `glimmer/dsl/{dsl_name}/dsl.rb` file, which configures the DSL into Glimmer via a call to:
```ruby
Glimmer::DSL::Engine.add_dynamic_expressions(DSLNameModule, expression_names_array)
```

Expression names are underscored verions of `Expression` subclass names minus the `_expression` suffix.

For example, here is an SWT DSL configuration:

```ruby
require 'glimmer/launcher'
require Glimmer::Launcher.swt_jar_file
require 'glimmer/dsl/engine'
Dir[File.expand_path('../*_expression.rb', __FILE__)].each {|f| require f}

module Glimmer
  module DSL
    module SWT
      Engine.add_dynamic_expressions(
        SWT,
        %w[
          layout
          widget_listener
          combo_selection_data_binding
          checkbox_group_selection_data_binding
          radio_group_selection_data_binding
          list_selection_data_binding
          tree_items_data_binding
          table_items_data_binding
          data_binding
          cursor
          font
          image
          property
          block_property
          widget
          custom_widget
        ]
      )
    end
  end
end
```

### Setup

Follow these steps to author a [Glimmer](https://rubygems.org/gems/glimmer) DSL:
- Add `gem 'glimmer', '~> 2.5.4'` to `Gemfile` and run `bundle` or run `gem install glimmer -v2.5.4` and add `require 'glimmer'`
- Create `glimmer/dsl/[dsl_name]/dsl.rb`, which requires and adds all dynamic expressions for the [dsl_name] Glimmer DSL module as per the code shown in the previous section (or [Official DSLs](#official-dsls) as examples)
- Create `glimmer/dsl/[dsl_name]/[expresion_name]_expresion.rb` for every [expresion_name] expression needed, whether dynamic or static

### Configuration

Glimmer configuration may be done via the [`Glimmer::Config`](https://github.com/AndyObtiva/glimmer/blob/master/lib/glimmer/config.rb) module.

#### logger

The Glimmer DSL engine supports logging via a standard `STDOUT` Ruby `Logger` configured in the `Glimmer::Config.logger` config option.
It is set to level Logger::ERROR by default.
Log level may be adjusted via `Glimmer::Config.logger.level` just like any other Ruby Logger.

Example:

```ruby
Glimmer::Config.logger.level = :debug
```
This results in more verbose debug loggging to `STDOUT`, which is very helpful in troubleshooting Glimmer DSL syntax when needed.

Example log:
```
D, [2017-07-21T19:23:12.587870 #35707] DEBUG -- : method: shell and args: []
D, [2017-07-21T19:23:12.594405 #35707] DEBUG -- : ShellCommandHandler will handle command: shell with arguments []
D, [2017-07-21T19:23:12.844775 #35707] DEBUG -- : method: composite and args: []
D, [2017-07-21T19:23:12.845388 #35707] DEBUG -- : parent is a widget: true
D, [2017-07-21T19:23:12.845833 #35707] DEBUG -- : on listener?: false
D, [2017-07-21T19:23:12.864395 #35707] DEBUG -- : WidgetCommandHandler will handle command: composite with arguments []
D, [2017-07-21T19:23:12.864893 #35707] DEBUG -- : widget styles are: []
D, [2017-07-21T19:23:12.874296 #35707] DEBUG -- : method: list and args: [:multi]
D, [2017-07-21T19:23:12.874969 #35707] DEBUG -- : parent is a widget: true
D, [2017-07-21T19:23:12.875452 #35707] DEBUG -- : on listener?: false
D, [2017-07-21T19:23:12.878434 #35707] DEBUG -- : WidgetCommandHandler will handle command: list with arguments [:multi]
D, [2017-07-21T19:23:12.878798 #35707] DEBUG -- : widget styles are: [:multi]
```

The `logger` instance may be replaced with a custom logger via `Glimmer::Config.logger = custom_logger`

To reset `logger` to the default instance, you may call `Glimmer::Config.reset_logger!`

All logging is done lazily via blocks (e.g. `logger.debug {message}`) to avoid affecting app performance with logging when below the configured logging level threshold.

[Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) enhances Glimmer default logging support via the Ruby [`logging`](https://github.com/TwP/logging) gem, enabling buffered asynchronous logging in a separate thread, thus completely unhindering normal desktop app performance.

#### loop_max_count

Glimmer has infinite loop detection support.
It can detect when an infinite loop is about to occur in method_missing and stops it.
It detects potential infinite loops when the same keyword and args repeat more than 100 times, which is unusual in a GUI app.

The max limit can be changed via the `Glimmer::Config::loop_max_count=(count)` config option.

Infinite loop detection may be disabled altogether if needed by setting `Glimmer::Config::loop_max_count` to `-1`

#### excluded_keyword_checkers

Glimmer permits consumers to exclude keywords from DSL processing by its engine via the `excluded_keyword_checkers` config option.

To do so, add a proc to it that returns a boolean indicating if a keyword is excluded or not.

Note that this proc runs within the context of the Glimmer object (as in the object mixing in the Glimmer module), so checker can can pretend to run there with its `self` object assumption.

Example of keywords excluded by [glimmer-dsl-swt](https://github.com/AndyObtiva/glimmer-dsl-swt):

```ruby
Glimmer::Config.excluded_keyword_checkers << lambda do |method_symbol, *args|
  method = method_symbol.to_s
  result = false
  result ||= method.start_with?('on_swt_') && is_a?(Glimmer::UI::CustomWidget) && respond_to?(method)
  result ||= method == 'dispose' && is_a?(Glimmer::UI::CustomWidget) && respond_to?(method)
  result ||= ['drag_source_proxy', 'drop_target_proxy'].include?(method) && is_a?(Glimmer::UI::CustomWidget)
  result ||= method == 'post_initialize_child'
  result ||= method.end_with?('=')
  result ||= ['finish_edit!', 'search', 'all_tree_items', 'depth_first_search'].include?(method) && is_a?(Glimmer::UI::CustomWidget) && body_root.respond_to?(method)
end
```

#### log_excluded_keywords

(default = false)

This just tells Glimmer whether to log excluded keywords or not (at the debug level). It is off by default.


### Multi-DSL Support

The Glimmer [DSL Engine](#dsl-engine) allows mixing DSLs, which comes in handy when doing things like rendering a desktop GUI DSL `browser` widget additionally leveraging the HTML DSL and CSS DSL for its content.

DSLs are activated by top-level keywords (expressions denoted as `TopLevelExpression`). For example, the `html` keyword activates the [Glimmer DSL for XML](https://github.com/AndyObtiva/glimmer-dsl-xml) and the `css` keyword activates the [Glimmer DSL for CSS](https://github.com/AndyObtiva/glimmer-dsl-css). Glimmer automatically recognizes top-level keywords in each DSL and activates the DSL accordingly. Once done processing a nested DSL top-level keyword, Glimmer switches back to the prior DSL automatically.

By default, all loaded DSLs (required glimmer DSL gems) are enabled.

For example, this shows "Hello, World!" inside a [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) desktop app `browser` widget using `html` and `css` from [Glimmer DSL for XML](https://github.com/AndyObtiva/glimmer-dsl-xml) and [Glimmer DSL for CSS](https://github.com/AndyObtiva/glimmer-dsl-css):

```ruby
require 'glimmer-dsl-swt'
require 'glimmer-dsl-xml'
require 'glimmer-dsl-css'

include Glimmer

shell {
  minimum_size 130, 130
  @browser = browser {
    text html {
      head {
        meta(name: "viewport", content: "width=device-width, initial-scale=2.0")
        style {
          css {
            h1 {
              background 'yellow'
            }
          }
        }
      }
      body {
        h1 { "Hello, World!" }
      }
    }
  }
}.open
```

**API methods to enable/disable DSLs:**

`Glimmer::DSL::Engine.disable_dsl(dsl)`: disables a particular DSL

Example: `Glimmer::DSL::Engine.disable_dsl(:swt)`

`Glimmer::DSL::Engine.enable_dsl(dsl)`: enables a particular DSL

Example: `Glimmer::DSL::Engine.disable_dsl(:swt)`

`Glimmer::DSL::Engine.enabled_dsls=(dsls)`: enables only the specified DSLs, disabling all other loaded DSLs

Example: `Glimmer::DSL::Engine.enabled_dsls = [:xml, :css]`

### Official DSLs

Here, we showcase official Glimmer DSLs; that is [gems starting with the `glimmer-dsl-` prefix](https://rubygems.org/search?query=glimmer-dsl-).

(you can skip ahead if you prefer to learn more about the Glimmer [DSL Engine](#dsl-engine) or [Data-Binding Library](#data-binding-library) first)

#### Glimmer DSL for SWT (JRuby Desktop Development GUI Framework)

[Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) is a native-GUI cross-platform desktop development library written in [JRuby](https://www.jruby.org/), an OS-threaded faster version of [Ruby](https://www.ruby-lang.org/en/). [Glimmer](https://rubygems.org/gems/glimmer)'s main innovation is a declarative [Ruby DSL](https://github.com/AndyObtiva/glimmer-dsl-swt#glimmer-dsl-syntax) that enables productive and efficient authoring of desktop application user-interfaces while relying on the robust [Eclipse SWT library](https://www.eclipse.org/swt/). [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) additionally innovates by having built-in [data-binding](https://github.com/AndyObtiva/glimmer-dsl-swt#data-binding) support, which greatly facilitates synchronizing the GUI with domain models, thus achieving true decoupling of object oriented components and enabling developers to solve business problems (test-first) without worrying about GUI concerns, or alternatively drive development GUI-first, and then write clean business models (test-first) afterwards. To get started quickly, [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) offers [scaffolding](https://github.com/AndyObtiva/glimmer-dsl-swt#scaffolding) options for [Apps](https://github.com/AndyObtiva/glimmer-dsl-swt#in-production), [Gems](https://github.com/AndyObtiva/glimmer-dsl-swt#custom-shell-gem), and [Custom Widgets](https://github.com/AndyObtiva/glimmer-dsl-swt#custom-widgets). [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) also includes native-executable [packaging](https://github.com/AndyObtiva/glimmer-dsl-swt#packaging--distribution) support, sorely lacking in other libraries, thus enabling the delivery of desktop apps written in [Ruby](https://www.ruby-lang.org/en/) as truly native DMG/PKG/APP files on the [Mac](https://www.apple.com/ca/macos) + [App Store](https://developer.apple.com/macos/distribution/) and MSI/EXE files on [Windows](https://www.microsoft.com/en-ca/windows).

To get started, visit the [Glimmer DSL for SWT project page](https://github.com/AndyObtiva/glimmer-dsl-swt#pre-requisites) for instructions on installing the [glimmer-dsl-swt gem](https://rubygems.org/gems/glimmer-dsl-swt).

##### Glimmer DSL for SWT Samples

###### Hello, World!

![Hello World](images/glimmer-hello-world.png)

Glimmer GUI code (from [samples/hello/hello_world.rb](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/samples/hello/hello_world.rb)):
```ruby
include Glimmer

shell {
  text "Glimmer"
  label {
    text "Hello, World!"
  }
}.open
```

###### Glimmer Tetris

![Tetris](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-swt/v4.18.3.1/images/glimmer-tetris.png)

Glimmer GUI code (from [samples/elaborate/tetris.rb](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/v4.18.3.1/samples/elaborate/tetris.rb)):

```ruby
# ...
    shell(:no_resize) {
      grid_layout {
        num_columns 2
        make_columns_equal_width false
        margin_width 0
        margin_height 0
        horizontal_spacing 0
      }
      
      text 'Glimmer Tetris'
      minimum_size 475, 500
      background :gray
      
      tetris_menu_bar(game: game)
            
      playfield(game_playfield: game.playfield, playfield_width: playfield_width, playfield_height: playfield_height, block_size: BLOCK_SIZE)
      
      score_lane(game: game, block_size: BLOCK_SIZE) {
        layout_data(:fill, :fill, true, true)
      }
    }
# ...
```

###### Hello, Table!

![Hello Table](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-swt/master/images/glimmer-hello-table.png)

Glimmer GUI code (from [samples/hello/hello_table.rb](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/samples/hello/hello_table.rb)):

```ruby
# ...
    shell {
      grid_layout
      
      text 'Hello, Table!'
      
      label {
        layout_data :center, :center, true, false
        
        text 'Baseball Playoff Schedule'
        font height: 30, style: :bold
      }
      
      combo(:read_only) {
        layout_data :center, :center, true, false
        selection bind(BaseballGame, :playoff_type)
        font height: 16
      }
      
      table(:editable) { |table_proxy|
        layout_data :fill, :fill, true, true
      
        table_column {
          text 'Game Date'
          width 150
          sort_property :date # ensure sorting by real date value (not `game_date` string specified in items below)
          editor :date_drop_down, property: :date_time
        }
        table_column {
          text 'Game Time'
          width 150
          sort_property :time # ensure sorting by real time value (not `game_time` string specified in items below)
          editor :time, property: :date_time
        }
        table_column {
          text 'Ballpark'
          width 180
          editor :none
        }
        table_column {
          text 'Home Team'
          width 150
          editor :combo, :read_only # read_only is simply an SWT style passed to combo widget
        }
        table_column {
          text 'Away Team'
          width 150
          editor :combo, :read_only # read_only is simply an SWT style passed to combo widget
        }
        table_column {
          text 'Promotion'
          width 150
          # default text editor is used here
        }
        
        # Data-bind table items (rows) to a model collection property, specifying column properties ordering per nested model
        items bind(BaseballGame, :schedule), column_properties(:game_date, :game_time, :ballpark, :home_team, :away_team, :promotion)
        
        # Data-bind table selection
        selection bind(BaseballGame, :selected_game)
        
        # Default initial sort property
        sort_property :date
        
        # Sort by these additional properties after handling sort by the column the user clicked
        additional_sort_properties :date, :time, :home_team, :away_team, :ballpark, :promotion
        
        menu {
          menu_item {
            text 'Book'
            
            on_widget_selected {
              book_selected_game
            }
          }
        }
      }
      
      button {
        text 'Book Selected Game'
        layout_data :center, :center, true, false
        font height: 16
        enabled bind(BaseballGame, :selected_game)
        
        on_widget_selected {
          book_selected_game
        }
      }
    }.open
# ...
```

##### Production Desktop Apps Built with Glimmer DSL for SWT

[<img alt="Are We There Yet Logo" src="https://raw.githubusercontent.com/AndyObtiva/are-we-there-yet/master/are-we-there-yet-logo.svg" width="40" />Are We There Yet?](https://github.com/AndyObtiva/are-we-there-yet) - Small Project Tracking App

[![Are We There Yet? App Screenshot](https://raw.githubusercontent.com/AndyObtiva/are-we-there-yet/master/are-we-there-yet-screenshot-windows.png)](https://github.com/AndyObtiva/are-we-there-yet)

[<img alt="Math Bowling Logo" src="https://raw.githubusercontent.com/AndyObtiva/MathBowling/master/images/math-bowling-logo.png" width="40" />Math Bowling](https://github.com/AndyObtiva/MathBowling) - Elementary Level Math Game Featuring Bowling Rules

[![Math Bowling App Screenshot](https://raw.githubusercontent.com/AndyObtiva/MathBowling/master/Math-Bowling-Screenshot.png)](https://github.com/AndyObtiva/MathBowling)

[<img alt="Garderie Rainbow Daily Agenda Logo" src="https://raw.githubusercontent.com/AndyObtiva/garderie_rainbow_daily_agenda/master/images/garderie_rainbow_daily_agenda_logo.png" width="40" />Garderie Rainbow Daily Agenda](https://github.com/AndyObtiva/garderie_rainbow_daily_agenda) -  A child nursery daily agenda reporting desktop app

[![Garderie Rainbow Daily Agenda App Screenshot](https://raw.githubusercontent.com/AndyObtiva/garderie_rainbow_daily_agenda/master/images/garderie_rainbow_daily_agenda_screenshot.png)](https://github.com/AndyObtiva/garderie_rainbow_daily_agenda)

#### Glimmer DSL for Opal (Pure Ruby Web GUI and Auto-Webifier of Desktop Apps)

[Glimmer DSL for Opal](https://github.com/AndyObtiva/glimmer-dsl-opal) is an experimental proof-of-concept web GUI adapter for [Glimmer](https://github.com/AndyObtiva/glimmer) desktop apps (i.e. apps built with [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt)). It webifies them via [Rails](https://rubyonrails.org/), allowing Ruby desktop apps to run on the web via [Opal Ruby](https://opalrb.com/) without changing a line of code. Apps may then be custom-styled for the web with standard CSS.

Glimmer DSL for Opal webifier successfully reuses the entire [Glimmer](https://github.com/AndyObtiva/glimmer) core DSL engine in [Opal Ruby](https://opalrb.com/) inside a web browser, and as such inherits the full range of powerful Glimmer desktop [data-binding](https://github.com/AndyObtiva/glimmer#data-binding) capabilities for the web.

To get started, visit the [Glimmer DSL for Opal project page](https://github.com/AndyObtiva/glimmer-dsl-opal) for instructions on installing the [glimmer-dsl-opal gem](https://rubygems.org/gems/glimmer-dsl-opal).

##### Glimmer DSL for Opal Samples

###### Hello, Computed!

Add the following require statement to `app/assets/javascripts/application.rb`


```ruby
require 'samples/hello/hello_computed'
```

Or add the Glimmer code directly if you prefer to play around with it:

```ruby
class HelloComputed
  class Contact
    attr_accessor :first_name, :last_name, :year_of_birth
  
    def initialize(attribute_map)
      @first_name = attribute_map[:first_name]
      @last_name = attribute_map[:last_name]
      @year_of_birth = attribute_map[:year_of_birth]
    end
  
    def name
      "#{last_name}, #{first_name}"
    end
  
    def age
      Time.now.year - year_of_birth.to_i
    rescue
      0
    end
  end
end

class HelloComputed
  include Glimmer

  def initialize
    @contact = Contact.new(
      first_name: 'Barry',
      last_name: 'McKibbin',
      year_of_birth: 1985
    )
  end

  def launch
    shell {
      text 'Hello, Computed!'
      composite {
        grid_layout {
          num_columns 2
          make_columns_equal_width true
          horizontal_spacing 20
          vertical_spacing 10
        }
        label {text 'First &Name: '}
        text {
          text bind(@contact, :first_name)
          layout_data {
            horizontal_alignment :fill
            grab_excess_horizontal_space true
          }
        }
        label {text '&Last Name: '}
        text {
          text bind(@contact, :last_name)
          layout_data {
            horizontal_alignment :fill
            grab_excess_horizontal_space true
          }
        }
        label {text '&Year of Birth: '}
        text {
          text bind(@contact, :year_of_birth)
          layout_data {
            horizontal_alignment :fill
            grab_excess_horizontal_space true
          }
        }
        label {text 'Name: '}
        label {
          text bind(@contact, :name, computed_by: [:first_name, :last_name])
          layout_data {
            horizontal_alignment :fill
            grab_excess_horizontal_space true
          }
        }
        label {text 'Age: '}
        label {
          text bind(@contact, :age, on_write: :to_i, computed_by: [:year_of_birth])
          layout_data {
            horizontal_alignment :fill
            grab_excess_horizontal_space true
          }
        }
      }
    }.open
  end
end

HelloComputed.new.launch
```
Glimmer app on the desktop (using [`glimmer-dsl-swt`](https://github.com/AndyObtiva/glimmer-dsl-swt) gem):

![Glimmer DSL for SWT Hello Computed](https://github.com/AndyObtiva/glimmer/blob/master/images/glimmer-hello-computed.png)

Glimmer app on the web (using `glimmer-dsl-opal` gem):

Start the Rails server:
```
rails s
```

Visit `http://localhost:3000`

You should see "Hello, Computed!"

![Glimmer DSL for Opal Hello Computed](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-opal/master/images/glimmer-dsl-opal-hello-computed.png)

###### Glimmer Calculator

Add the [glimmer-cs-calculator](https://github.com/AndyObtiva/glimmer-cs-calculator) gem to `Gemfile` (without requiring):

```
gem 'glimmer-cs-calculator', require: false
```

Add the following require statement to `app/assets/javascripts/application.rb`

```ruby
require 'glimmer-cs-calculator/launch'
```

Sample GUI code (relies on custom widgets `command_button`, `operation_button`, and `number_button`):

```ruby
# ...
shell {
  minimum_size (OS.mac? ? 320 : (OS.windows? ? 390 : 520)), 240
  image File.join(APP_ROOT, 'package', 'windows', "Glimmer Calculator.ico") if OS.windows?
  text "Glimmer - Calculator"
  grid_layout 4, true
  # Setting styled_text to multi in order for alignment options to activate
  styled_text(:multi, :wrap, :border) {
    text bind(@presenter, :result)
    alignment swt(:right)
    right_margin 5
    font height: 40
    layout_data(:fill, :fill, true, true) {
      horizontal_span 4
    }
    editable false
    caret nil
  }
  command_button('AC')
  operation_button('÷')
  operation_button('×')
  operation_button('−')
  (7..9).each { |number|
    number_button(number)
  }
  operation_button('+', font: @button_font_big, vertical_span: 2)
  (4..6).each { |number|
    number_button(number)
  }
  (1..3).each { |number|
    number_button(number)
  }
  command_button('=', font: @button_font_big, vertical_span: 2)
  number_button(0, horizontal_span: 2)
  operation_button('.')
}
# ...
```

Glimmer app on the desktop (using the [`glimmer-dsl-swt`](https://github.com/AndyObtiva/glimmer-dsl-swt) gem):

![Glimmer Calculator Linux](https://raw.githubusercontent.com/AndyObtiva/glimmer-cs-calculator/master/glimmer-cs-calculator-screenshot-linux.png)

Glimmer app on the web (using `glimmer-dsl-opal` gem):

Start the Rails server:
```
rails s
```

Visit `http://localhost:3000`
(or visit: http://glimmer-cs-calculator-server.herokuapp.com)

You should see "Glimmer Calculator"

[![Glimmer Calculator Opal](https://raw.githubusercontent.com/AndyObtiva/glimmer-cs-calculator/master/glimmer-cs-calculator-screenshot-opal.png)](http://glimmer-cs-calculator-server.herokuapp.com)

Here is an Apple Calculator CSS themed version (with [CSS only](https://github.com/AndyObtiva/glimmer-cs-calculator/blob/master/server/glimmer-cs-calculator-server/app/assets/stylesheets/welcomes_apple.scss), no app code changes):

Visit http://glimmer-cs-calculator-server.herokuapp.com/welcomes/apple

You should see "Apple Calculator Theme"

[![Glimmer Calculator Opal Apple Calculator Theme](https://raw.githubusercontent.com/AndyObtiva/glimmer-cs-calculator/master/glimmer-cs-calculator-screenshot-opal-apple.png)](http://glimmer-cs-calculator-server.herokuapp.com/welcomes/apple)

#### Glimmer DSL for Tk (MRI Ruby Desktop Development GUI Library)

[Tcl/Tk](https://www.tcl.tk/) has recently improved by gaining native looking themed widgets on Mac, Windows, and Linux in [Tk version 8.5](https://www.tcl.tk/software/tcltk/8.5.html#:~:text=Highlights%20of%20Tk%208.5&text=Font%20rendering%3A%20Now%20uses%20anti,and%20window%20layout%2C%20and%20more.). Additionally, [Ruby](https://www.ruby-lang.org/en/) 3.0 Ractor (formerly known as [Guilds](https://olivierlacan.com/posts/concurrency-in-ruby-3-with-guilds/)) supports truly parallel multi-threading, making both [MRI](https://github.com/ruby/ruby) and [Tk](https://www.tcl.tk/) finally viable for support in [Glimmer](https://github.com/AndyObtiva/glimmer) (Ruby Desktop Development GUI Library) as an alternative to [JRuby on SWT](https://github.com/AndyObtiva/glimmer-dsl-swt).

The trade-off is that while [SWT](https://www.eclipse.org/swt/) provides a plethora of high quality reusable widgets for the Enterprise (such as [Nebula](https://www.eclipse.org/nebula/)), [Tk](https://www.tcl.tk/) enables very fast app startup time and a small memory footprint via [MRI Ruby](https://www.ruby-lang.org/en/).

[Glimmer DSL for Tk](https://github.com/AndyObtiva/glimmer-dsl-tk) aims to provide a DSL similar to the [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) to enable more productive desktop development in Ruby with:
- Declarative DSL syntax that visually maps to the GUI widget hierarchy
- Convention over configuration via smart defaults and automation of low-level details
- Requiring the least amount of syntax possible to build GUI
- Bidirectional Data-Binding to declaratively wire and automatically synchronize GUI with Business Models
- Custom Widget support
- Scaffolding for new custom widgets, apps, and gems
- Native-Executable packaging on Mac, Windows, and Linux

To get started, visit the [Glimmer DSL for Tk project page](https://github.com/AndyObtiva/glimmer-dsl-tk#pre-requisites) for instructions on installing the [glimmer-dsl-tk gem](https://rubygems.org/gems/glimmer-dsl-tk).

##### Glimmer DSL for Tk Samples

###### Hello, World!

Glimmer code (from [samples/hello/hello_world.rb](https://github.com/AndyObtiva/glimmer-dsl-tk/blob/master/samples/hello/hello_world.rb)):

```ruby
include Glimmer

root {
  label {
    text 'Hello, World!'
  }
}.open
```

Run (with the [glimmer-dsl-tk](https://rubygems.org/gems/glimmer-dsl-tk) gem installed):

```
ruby -r glimmer-dsl-tk -e "require '../samples/hello/hello_world.rb'"
```

Glimmer app:

![glimmer dsl tk screenshot sample hello world](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-tk/master/images/glimmer-dsl-tk-screenshot-sample-hello-world.png)

###### Hello, Notebook!

Glimmer code (from [samples/hello/hello_tab.rb](https://github.com/AndyObtiva/glimmer-dsl-tk/blob/master/samples/hello/hello_tab.rb)):

```ruby
include Glimmer

root {
  title 'Hello, Notebook!'
   
  notebook {
    frame(text: 'English') {
      label {
        text 'Hello, World!'
      }
    }
     
    frame(text: 'French') {
      label {
        text 'Bonjour, Univers!'
      }
    }
  }
}.open
```

Run (with the [glimmer-dsl-tk](https://rubygems.org/gems/glimmer-dsl-tk) gem installed):

```
ruby -r glimmer-dsl-tk -e "require '../samples/hello/hello_notebook.rb'"
```

Glimmer app:

![glimmer dsl tk screenshot sample hello notebook English](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-tk/master/images/glimmer-dsl-tk-screenshot-sample-hello-notebook-english.png)
![glimmer dsl tk screenshot sample hello notebook French](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-tk/master/images/glimmer-dsl-tk-screenshot-sample-hello-notebook-french.png)

###### Hello, Combobox!

Glimmer code (from [samples/hello/hello_combobox.rb](https://github.com/AndyObtiva/glimmer-dsl-tk/blob/master/samples/hello/hello_combobox.rb)):

```ruby
require 'glimmer-dsl-tk'

class Person
  attr_accessor :country, :country_options

  def initialize
    self.country_options=["", "Canada", "US", "Mexico"]
    self.country = "Canada"
  end

  def reset_country
    self.country = "Canada"
  end
end

class HelloCombobox
  include Glimmer
  
  def launch
    person = Person.new
    
    root {
      title 'Hello, Combobox!'
      
      combobox {
        readonly true # this applies to text editing only (item selection still triggers a write to model)
        text <=> [person, :country]
      }
      
      button {
        text "Reset Selection"
        command {
          person.reset_country
        }
      }
    }.open
  end
end

HelloCombobox.new.launch
```

Run (with the [glimmer-dsl-tk](https://rubygems.org/gems/glimmer-dsl-tk) gem installed):

```
ruby -r glimmer-dsl-tk -e "require '../samples/hello/hello_combobox.rb'"
```

Glimmer app:

![glimmer dsl tk screenshot sample hello combobox](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-tk/master/images/glimmer-dsl-tk-screenshot-sample-hello-combobox.png)
![glimmer dsl tk screenshot sample hello combobox dropdown](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-tk/master/images/glimmer-dsl-tk-screenshot-sample-hello-combobox-dropdown.png)

#### Glimmer DSL for LibUI (Prerequisite-Free Ruby Desktop Development GUI Library)

[Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui) is a prerequisite-free Ruby desktop development GUI library. No need to pre-install any prerequisites. Just install the gem and have platform-independent native GUI that just works!

[LibUI](https://github.com/kojix2/LibUI) is a thin [Ruby](https://www.ruby-lang.org/en/) wrapper around [libui](https://github.com/andlabs/libui), a relatively new C GUI library that renders native controls on every platform (similar to [SWT](https://www.eclipse.org/swt/), but without the heavy weight of the [Java Virtual Machine](https://www.java.com/en/)).

The main trade-off in using [Glimmer DSL for LibUI](https://rubygems.org/gems/glimmer-dsl-libui) as opposed to [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) or [Glimmer DSL for Tk](https://github.com/AndyObtiva/glimmer-dsl-tk) is the fact that [SWT](https://www.eclipse.org/swt/) and [Tk](https://www.tcl.tk/) are more mature than mid-alpha [libui](https://github.com/andlabs/libui) as GUI toolkits. Still, if there is only a need to build a small simple application, [Glimmer DSL for LibUI](https://rubygems.org/gems/glimmer-dsl-libui) could be a good convenient choice due to having zero prerequisites beyond the dependencies included in the [Ruby gem](https://rubygems.org/gems/glimmer-dsl-libui). Also, just like [Glimmer DSL for Tk](https://github.com/AndyObtiva/glimmer-dsl-tk), its apps start instantly and have a small memory footprint. [LibUI](https://github.com/kojix2/LibUI) is a promising new GUI toolkit that might prove quite worthy in the future.

[Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui) aims to provide a DSL similar to the [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) to enable more productive desktop development in Ruby with:
- Declarative DSL syntax that visually maps to the GUI widget hierarchy
- Convention over configuration via smart defaults and automation of low-level details
- Requiring the least amount of syntax possible to build GUI
- Bidirectional Data-Binding to declaratively wire and automatically synchronize GUI with Business Models
- Custom Widget support
- Scaffolding for new custom widgets, apps, and gems
- Native-Executable packaging on Mac, Windows, and Linux

##### Glimmer DSL for LibUI Samples

###### Hello, World!

```ruby
require 'glimmer-dsl-libui'

include Glimmer

window('hello world').show
```

Mac

![glimmer-dsl-libui-mac-basic-window.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-mac-basic-window.png)

Windows

![glimmer-dsl-libui-windows-basic-window.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-windows-basic-window.png)

Linux

![glimmer-dsl-libui-linux-basic-window.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-linux-basic-window.png)

###### Basic Table Progress Bar

```ruby
require 'glimmer-dsl-libui'

include Glimmer

data = [
  ['task 1', 0],
  ['task 2', 15],
  ['task 3', 100],
  ['task 4', 75],
  ['task 5', -1],
]

window('Task Progress', 300, 200) {
  vertical_box {
    table {
      text_column('Task')
      progress_bar_column('Progress')

      cell_rows data # implicit data-binding
    }
    
    button('Mark All As Done') {
      stretchy false
      
      on_clicked do
        data.each_with_index do |row_data, row|
          data[row] = [row_data[0], 100] # automatically updates table due to implicit data-binding
        end
      end
    }
  }
}.show
```

Mac

![glimmer-dsl-libui-mac-basic-table-progress-bar.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-mac-basic-table-progress-bar.png)

Windows

![glimmer-dsl-libui-windows-basic-table-progress-bar.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-windows-basic-table-progress-bar.png)

Linux

![glimmer-dsl-libui-linux-basic-table-progress-bar.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-linux-basic-table-progress-bar.png)

###### Area Gallery

```ruby
require 'glimmer-dsl-libui'

include Glimmer

window('Area Gallery', 400, 400) {
  area {
    path { # declarative stable path
      square(0, 0, 100)
      square(100, 100, 400)
      
      fill r: 102, g: 102, b: 204
    }
    path { # declarative stable path
      rectangle(0, 100, 100, 400)
      rectangle(100, 0, 400, 100)
      
      fill r: 204, g: 102, b: 204
    }
    path { # declarative stable path
      figure(100, 100) {
        line(100, 400)
        line(400, 100)
        line(400, 400)

        closed true
      }

      fill r: 202, g: 102, b: 104, a: 0.5
      stroke r: 0, g: 0, b: 0
    }
    path { # declarative stable path
      figure(0, 0) {
        bezier(200, 100, 100, 200, 400, 100)
        bezier(300, 100, 100, 300, 100, 400)
        bezier(100, 300, 300, 100, 400, 400)

        closed true
      }

      fill r: 202, g: 102, b: 204, a: 0.5
      stroke r: 0, g: 0, b: 0, thickness: 2, dashes: [50, 10, 10, 10], dash_phase: -50.0
    }
    path { # declarative stable path
      arc(200, 200, 90, 0, 360, false)

      fill r: 202, g: 102, b: 204, a: 0.5
      stroke r: 0, g: 0, b: 0, thickness: 2
    }
    
    on_mouse_event do |area_mouse_event|
      p area_mouse_event
    end
    
    on_mouse_moved do |area_mouse_event|
      puts 'moved'
    end
    
    on_mouse_down do |area_mouse_event|
      puts 'mouse down'
    end
    
    on_mouse_up do |area_mouse_event|
      puts 'mouse up'
    end
    
    on_mouse_drag_started do |area_mouse_event|
      puts 'drag started'
    end
    
    on_mouse_dragged do |area_mouse_event|
      puts 'dragged'
    end
    
    on_mouse_dropped do |area_mouse_event|
      puts 'dropped'
    end
    
    on_mouse_entered do
      puts 'entered'
    end
    
    on_mouse_exited do
      puts 'exited'
    end
    
    on_key_event do |area_key_event|
      p area_key_event
    end
    
    on_key_up do |area_key_event|
      puts 'key up'
    end
    
    on_key_down do |area_key_event|
      puts 'key down'
    end
  }
}.show
```

Mac

![glimmer-dsl-libui-mac-area-gallery.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-mac-area-gallery.png)

Windows

![glimmer-dsl-libui-windows-area-gallery.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-windows-area-gallery.png)

Linux

![glimmer-dsl-libui-linux-area-gallery.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-linux-area-gallery.png)

#### Glimmer DSL for XML (& HTML)

[Glimmer DSL for XML](https://github.com/AndyObtiva/glimmer-dsl-xml) provides Ruby syntax for building XML (eXtensible Markup Language) documents.

Within the context of desktop development, Glimmer DSL for XML is useful in providing XML data for the [SWT Browser widget](https://github.com/AndyObtiva/glimmer/tree/master#browser-widget).

##### XML DSL

Simply start with `html` keyword and add HTML inside its block using Glimmer DSL syntax.
Once done, you may call `to_s`, `to_xml`, or `to_html` to get the formatted HTML output.

Here are all the Glimmer XML DSL top-level keywords:
- `html`
- `tag`: enables custom tag creation for exceptional cases by passing tag name as '_name' attribute
- `name_space`: enables namespacing html tags

Element properties are typically passed as a key/value hash (e.g. `section(id: 'main', class: 'accordion')`) . However, for properties like "selected" or "checked", you must leave value `nil` or otherwise pass in front of the hash (e.g. `input(:checked, type: 'checkbox')` )

Example (basic HTML):

```ruby
@xml = html {
  head {
    meta(name: "viewport", content: "width=device-width, initial-scale=2.0")
  }
  body {
    h1 { "Hello, World!" }
  }
}
puts @xml
```

Output:

```
<html><head><meta name="viewport" content="width=device-width, initial-scale=2.0" /></head><body><h1>Hello, World!</h1></body></html>
```

#### Glimmer DSL for CSS

[Glimmer DSL for CSS](https://github.com/AndyObtiva/glimmer-dsl-css) provides Ruby syntax for building CSS (Cascading Style Sheets).

Within the context of [Glimmer](https://github.com/AndyObtiva/glimmer) app development, Glimmer DSL for CSS is useful in providing CSS for the [SWT Browser widget](https://github.com/AndyObtiva/glimmer/tree/master#browser-widget).

##### CSS DSL

Simply start with `css` keyword and add stylesheet rule sets inside its block using Glimmer DSL syntax.
Once done, you may call `to_s` or `to_css` to get the formatted CSS output.

`css` is the only top-level keyword in the Glimmer CSS DSL

Selectors may be specified by `s` keyword or HTML element keyword directly (e.g. `body`)
Rule property values may be specified by `pv` keyword or underscored property name directly (e.g. `font_size`)

Example:

```ruby
@css = css {
  body {
    font_size '1.1em'
    pv 'background', 'white'
  }
  
  s('body > h1') {
    background_color :red
    pv 'font-size', '2em'
  }
}
puts @css
```

Output:

```
body{font-size:1.1em;background:white}body > h1{background-color:red;font-size:2em}
```

## Data-Binding Library

Data-Binding enables mapping GUI properties (like text and color) to Model attributes (like name and age) for bidirectional or unidirectional synchronization and conversion as needed.

Glimmer enhances observed models automatically (including array operations like `<<`, `delete`, and `reject!`) on first observation. As such, you get automatic observable support, including nested and computed observations. No need to change your model code to data-bind it to the view or add repetitive boilerplate modules. View data-binding is truly decoupled from model logic by being able to observe any model attribute (Ruby attribute reader/writer combo or Ruby attribute reader alone for read-only data-binding when needed)

This relies mainly on the Observer Design Pattern and the MVP (Model-View-Presenter) Architectural Pattern (a variation on MVC)

These are the main classes concerning data-binding:
- `Glimmer::DataBinding::Observer`: Provides general observer support including unique registration and deregistration for cleanup and prevention of memory leaks. Main methods concerned are: `call`, `register` (alias: `observe`), and `unregister` (alias: `unobserve` or `deregister`). Passing the option `ignore_frozen: true` at the end of the args of `register` (alias: `observe`) method results in silently ignoring any passed frozen observable without raising an error (it raises an error otherwise for frozen/immutable objects).
- `Glimmer::DataBinding::Observable`: General super-module for all observables. Main methods concerned are: `add_observer` and `remove_observer`
- `Glimmer::DataBinding::ObservableModel`: Mixin module for any observable model (`Object`, `Struct` or `OpenStruct`) with observable attributes (observes attribute writers and `Struct`/`OpenStruct` `:[]=` method). In addition to `Observable` methods, it has a `notify_observers` method to be called when changes occur. It automatically enhances all attribute setters (ending with `=`) to notify observers on changes. Also, it automatically handles observing array attributes using `ObservableArray` appropriately so they would notify observers upon array mutation changes. `:attribute_writer_type` option can be specified (default: `:attribute=`) to observe different attribute styles (e.g. `attribute_writer_type: [:attribute=, :set_attribute]`).
- `Glimmer::DataBinding::ObservableArray`: Mixin module for any observable array collection that automatically handles notifying observers upon performing array mutation operations (e.g. `push`, `select!`, or `delete`) recursively (meaning if an array contained arrays and they changed, observers are notified). Accepts `recursive: true` option in `add_observer` method to recursively observe nested arrays all the way down. Alternatively, pass `recursive: [integer]` to limit recursion in `Array` observation to a specific number of levels beyond the first level (which is always included).
- `Glimmer::DataBinding::ObservableHash`: Mixin module for any observable hash that automatically handles notifying observers upon performing hash mutation operations (e.g. `hash[key]=value`, `select!`, `merge!`).  Also, it automatically handles observing array values using `ObservableArray` appropriately so they would notify observers upon array mutation changes.
- `Glimmer::DataBinding::ModelBinding`: a higher-level abstraction that relies on all the other observer/observable classes to support basic data-binding, nested data-binding, and computed data-binding
- `Glimmer::DataBinding::Shine`: enables highly intuitive and visually expressive syntax to perform bidirectional (two-way) data-binding with `<=>` and unidirectional (one-way) data-binding with `<=`

To do simple observation of models, arrays, or hashes, you can use the `Glimmer::DataBinding::Observer::proc` method, which builds an observer from a block. When invoking the `#observe` method on it, it automatically enhances the object argument being observed into an `Observable` (whether `ObservableModel`, `ObservableArray`, or `ObervableHash`).

Example of observing a model attribute:

```ruby
Glimmer::DataBinding::Observer.proc do |new_value|
  # Do some work with new value for model attribute
end.observe(model, attribute)
```

Example of observing an array recursively (avoid recursion unless really needed since it fires on all fine-grained nested array changes):

```ruby
Glimmer::DataBinding::Observer.proc do |new_value|
  # Do some work with new array value
end.observe(array, recursive: true)
```

Example of observing a hash key:

```ruby
Glimmer::DataBinding::Observer.proc do |new_value|
  # Do some work with new value for hash key
end.observe(hash, :price)
```

Example of observing a hash for all key changes:

```ruby
Glimmer::DataBinding::Observer.proc do |new_value, changed_key|
  # Do some work with new value and changed key for hash
end.observe(hash)
```

If you would like to observe nested model attribute changes and/or indexed array changes (specifying a nested array index/indices), you can use the more advanced `Glimmer::DataBinding::ModelBinding` class instead.

Example of observing nested model attributes:

```ruby
ModelBinding.new(model, "address1.street").add_observer do |new_address1_street_value|
  # Do some work with new address 1 street value
end
```

Example of observing indexed array changes (combined with a nested model attribute):

```ruby
ModelBinding.new(model, "employees[5].name").add_observer do |new_employee_6_name|
  # Do some work with new employee 6 (index 5)'s name
end
```

Example of observing double-indexed nested array changes:

```ruby
ModelBinding.new(model, "grid[5][7]").add_observer do |new_grid_cell_value|
  # Do some work with new grid cell value for row index 5 and column index 7
end
```

Data-bound `ModelBinding` attribute can be:
- **Direct:** `Symbol` representing attribute reader/writer (e.g. `[person, :name`])
- **Nested:** `String` representing nested attribute path (e.g. `[company, 'address.street']`). That results in "nested data-binding"
- **Indexed:** `String` containing array attribute index (e.g. `[customer, 'addresses[0].street']`). That results in "indexed data-binding"

Data-binding options include:
- `before_read {|value| ...}`: performs an operation before reading data from Model to update View.
- `on_read {|value| ...}`: converts value read from Model to update the View.
- `after_read {|converted_value| ...}`: performs an operation after read from Model to update View.
- `before_write {|value| ...}`: performs an operation before writing data to Model from View.
- `on_write {|value| ...}`: converts value read from View to update the Model.
- `after_write {|converted_value| ...}`: performs an operation after writing to Model from View.
- `computed_by attribute` or `computed_by [attribute1, attribute2, ...]`: indicates model attribute is computed from specified attribute(s), thus updated when they are updated. That is known as "computed data-binding".

Note that if an observed model attribute or hash key is an array, it is automatically observed for array changes, not just attribute/key-value changes.

All of the features above make Glimmer's data-binding library one of the most sophisticated and advanced in the industry since it automates everything instead of requiring endless manual configuration, thus resulting in some of the tersest most declarative syntax for using observers and data-binding.

You may learn more by looking into [data-binding specs](/Users/andy/code/glimmer/spec/lib/glimmer/data_binding) as well as [Data-Binding](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#data-binding) and [Observer](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#observer) usage in [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt)

## Glimmer Process

[Glimmer Process](PROCESS.md) is the lightweight software development process used for building Glimmer libraries and Glimmer apps, which goes beyond Agile, rendering all Agile processes obsolete. [Glimmer Process](PROCESS.md) is simply made up of 7 guidelines to pick and choose as necessary until software development needs are satisfied.

Learn more by reading the [GPG](PROCESS.md) (Glimmer Process Guidelines)

## Resources

* [Code Master Blog](http://andymaleh.blogspot.com/search/label/Glimmer)
* [JRuby Cookbook by Justin Edelson & Henry Liu](http://shop.oreilly.com/product/9780596519650.do)
* [MountainWest RubyConf 2011 Video](https://confreaks.tv/videos/mwrc2011-whatever-happened-to-desktop-development-in-ruby)
* [RubyConf 2008 Video](https://confreaks.tv/videos/rubyconf2008-desktop-development-with-glimmer)
* [InfoQ Article](http://www.infoq.com/news/2008/02/glimmer-jruby-swt)
* [DZone Tutorial](https://dzone.com/articles/an-introduction-glimmer)

## Help

### Issues

You may submit [issues](https://github.com/AndyObtiva/glimmer/issues) on [GitHub](https://github.com/AndyObtiva/glimmer/issues).

[Click here to submit an issue.](https://github.com/AndyObtiva/glimmer/issues)

### Chat

If you need live help, try to [![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Feature Suggestions

These features have been suggested. You might see them in a future version of Glimmer. You are welcome to contribute more feature suggestions.

[glimmer-dsl-swt/TODO.md](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/TODO.md)

Glimmer DSL Engine specific tasks are at:

[TODO.md](TODO.md)

## Change Log

[glimmer-dsl-swt/CHANGELOG.md](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/CHANGELOG.md)

[CHANGELOG.md](CHANGELOG.md)

## Contributing

**Contributors Wanted!**

If you would like to contribute to Glimmer, please study up on Glimmer and [SWT](https://github.com/AndyObtiva/glimmer-dsl-swt#swt-reference), run all Glimmer [samples](https://github.com/AndyObtiva/glimmer-dsl-swt#samples), and build a small sample app (perhaps from [this TODO list](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/TODO.md#samples)) to add to [glimmer-dsl-swt](https://github.com/AndyObtiva/glimmer-dsl-swt) Hello or Elaborate samples via a Pull Request. Once done, contact me on [Chat](#chat).

You may apply for contributing to any of these Glimmer DSL gems whether you prefer to focus on the desktop or web:
- [glimmer-dsl-swt](https://github.com/AndyObtiva/glimmer-dsl-swt): Glimmer DSL for SWT (JRuby Desktop Development GUI Framework)
- [glimmer-dsl-opal](https://github.com/AndyObtiva/glimmer-dsl-opal): Glimmer DSL for Opal (Pure Ruby Web GUI and Auto-Webifier of Desktop Apps)
- [glimmer-dsl-tk](https://github.com/AndyObtiva/glimmer-dsl-tk): Glimmer DSL for Tk (MRI Ruby Desktop Development GUI Library)
- [glimmer-dsl-libui](https://github.com/AndyObtiva/glimmer-dsl-libui): Glimmer DSL for LibUI (Prerequisite-Free Ruby Desktop Development GUI Library)
- [glimmer-dsl-xml](https://github.com/AndyObtiva/glimmer-dsl-xml): Glimmer DSL for XML (& HTML)
- [glimmer-dsl-css](https://github.com/AndyObtiva/glimmer-dsl-css): Glimmer DSL for CSS

[CONTRIBUTING.md](CONTRIBUTING.md)

## Contributors

* [Andy Maleh](https://github.com/AndyObtiva) (Founder)
* [Dennis Theisen](https://github.com/Soleone) (Contributor)

[Click here to view contributor commits.](https://github.com/AndyObtiva/glimmer/graphs/contributors)

## Hire Me

If your company would like to invest fulltime in further development of the Glimmer open-source project, [hire me](https://www.linkedin.com/in/andymaleh/).

## License

[MIT](LICENSE.txt)

Copyright (c) 2007-2021 - Andy Maleh.

--

Glimmer logo was made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
