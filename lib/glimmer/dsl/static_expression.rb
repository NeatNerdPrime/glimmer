# Copyright (c) 2007-2022 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'facets/string/underscore'

require 'glimmer/error'
require 'glimmer/dsl/engine'
require 'glimmer/dsl/expression'

module Glimmer
  module DSL
    # Represents a StaticExpression for expressions where
    # the keyword does not vary dynamically. These static keywords are then
    # predefined as methods in Glimmer instead of needing method_missing
    #
    # StaticExpression subclasses may optionally implement `#can_interpret?`
    # (not needed if it only checks for keyword)
    #
    # StaticExpression subclasses must define `#interpret`.
    #
    # The direct parent namespace of a StaticExpression subclass must match the DSL name (case-insensitive)
    # (e.g. Glimmer::DSL::SWT::WidgetExpression has a DSL of :swt)
    class StaticExpression < Expression
      class << self
        def inherited(base)
          Glimmer::DSL::Engine.add_static_expression(base.new)
          super
        end

        def keyword
          @keyword ||= name.split(/::/).last.sub(/Expression$/, '').underscore
        end
      end

      # Subclasses may optionally implement, but by default it only ensures that
      # the keyword matches lower case static expression class name minus `Expression`
      def can_interpret?(parent, keyword, *args, &block)
        true
      end
    end
  end
end
