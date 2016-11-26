module Scratch
  class Interpreter
    # Add printing words to the dictionary
    def load_math_words
      math_words = 
        {
          "+" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 2)
            a = terp.stack.pop.to_i
            b = terp.stack.pop.to_i
            terp.stack.push(a  + b)
          },
          "-" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 2)
            a = terp.stack.pop.to_i
            b = terp.stack.pop.to_i
            terp.stack.push(b  - a)
          },
          "*" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 2)
            a = terp.stack.pop.to_i
            b = terp.stack.pop.to_i
            terp.stack.push(a  * b)
          },
          "/" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 2)
            a = terp.stack.pop.to_i
            b = terp.stack.pop.to_i
            terp.stack.push(b  / a)
          },
          "SQRT" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 1)
            a = terp.stack.pop.to_i
            terp.stack.push(Math.sqrt(a))
          }
        }

      add_words(math_words)
    end
  end
end