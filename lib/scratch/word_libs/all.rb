require_relative './_word_helpers.rb'

require_relative './printing_words.rb'
require_relative './stack_manipulation_words.rb'

require_relative './math_words.rb'

module Scratch
  class Interpreter
    def load_all_words
      load_printing_words
      load_stack_manipulation_words
      load_math_words
    end
  end
end