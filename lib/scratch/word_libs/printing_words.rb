module Scratch
  class Interpreter
    # add printing words to the dictionary
    def load_printing_words
      printing_words = 
        {
          "PRINT" => lambda {|terp|
            if terp.stack.length > 0
              print terp.stack.pop
              puts
            else
              raise EmptyStackError
            end
          },
          "PSTACK" => lambda {|terp|
            if terp.stack.length > 0
              print terp.stack.join(" ")
            else
              print "Stack is empty"
            end

            puts
          }
        }

      add_words(printing_words)
    end
  end
end