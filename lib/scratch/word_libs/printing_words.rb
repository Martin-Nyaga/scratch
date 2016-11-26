module Scratch
  class Interpreter
    # add printing words to the dictionary
    def load_printing_words
      printing_words = 
        {
          "PRINT" => lambda {|s|
            if s.stack.length > 0
              print s.stack.pop
              puts
            else
              raise EmptyStackError
            end
          }
        }

      add_words(printing_words)
    end
  end
end