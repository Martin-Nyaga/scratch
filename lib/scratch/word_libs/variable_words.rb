module Scratch
  class Interpreter
    # Add printing words to the dictionary
    def load_variable_words
      variable_words = 
        {
          "VAR" => lambda {|terp|
            var_name = terp.lexer.next_word
            if !var_name
              raise SyntaxError, "Unexpected end of input."
            end
            
            terp.define(var_name, make_variable(terp))
          },
          "ASSIGN" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 2)
            ref = terp.stack.pop
            val = terp.stack.pop
            ref[:value] = val
          },
          "FETCH" => lambda {|terp|
            WordHelpers.require_items_on_stack(terp, 1)
            ref = terp.stack.pop
            terp.stack.push(ref[:value])
          }
        }

      add_words(variable_words)
    end

    # Define a new dictionary word with some code
    def define word, func
      @dictionary[word.upcase] = func
    end

    private
    def make_variable(terp)
      var = { value: nil }
      return lambda { |terp| terp.stack.push(var) }
    end
  end
end
