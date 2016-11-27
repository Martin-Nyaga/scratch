module Scratch
  class Interpreter
    # Add string words to the dictionary
    def load_string_words
      string_words = 
        {
          # Start of a string
          '"' => lambda {|terp|
            word = WordHelpers.get_next_word(terp)

            # read words until next double quote
            # raise synsax error if words are over
            while (curr_word = terp.lexer.next_word) != '"'
              raise(SyntaxError, 'Unexpected end of input. Expecting closing "') if curr_word.nil?
              word = word + " " + curr_word
            end
            terp.stack.push(word)
          },
          # Start of a comment
          '#' => lambda {|terp|
            # read words until next comment char
            while (curr_word = terp.lexer.next_word) != '#'
              raise(SyntaxError, 'Unexpected end of input. Expecting closing #') if curr_word.nil?
            end
          }
        }

      add_words(string_words)
    end
  end
end