require_relative './_word_helpers.rb'

# libs
require_relative './printing_words.rb'
require_relative './stack_manipulation_words.rb'
require_relative './variable_words.rb'
require_relative './string_words.rb'
require_relative './math_words.rb'

module Scratch
  class Interpreter
    def load_all_words
      load_printing_words
      load_stack_manipulation_words
      load_variable_words

      load_math_words
      load_string_words
    end
  end
end