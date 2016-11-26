module Scratch
  class Interpreter
    # Add printing words to the dictionary
    def load_stack_manipulation_words
      stack_manipulation_words = 
        {
          "DUP" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 1)
            terp.stack.push(terp.stack.last)
          },
          "SWAP" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 2)
            a, b = terp.stack.last(2)
            2.times { terp.stack.pop }
            terp.stack += [b, a]
          },
          "DROP" => lambda {|terp|
            terp.stack.pop
          },
          "DROPSTACK" => lambda {|terp|
            terp.drop_stack!
          }
        }

      add_words(stack_manipulation_words)
    end
  end
end