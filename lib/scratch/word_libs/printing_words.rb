module Scratch
  class Interpreter
    # Add printing words to the dictionary
    def load_printing_words
      printing_words = 
        {
          "PRINT" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 1)
            print terp.stack.pop
            puts
          },
          "PSTACK" => lambda {|terp|
            # make delimiter blue if interactive
            if @interactive 
              print terp.stack.join(Scratch::STACK_DELIMITER.blue)
            else
              print terp.stack.join(Scratch::STACK_DELIMITER)
            end
            puts
          }
        }

      add_words(printing_words)
    end
  end
end