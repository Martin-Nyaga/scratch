module Scratch
  class Lexer
    attr_reader :words, :next
    
    # Split up text by whitespace
    # @param text [String] The text to be intepreted
    def initialize(text)
      @words = text.split(" ")
      @next = 0
    end

    # Return the next word in the text
    def next_word
      return if @next > @words.length
      word = @words[@next]
      @next += 1

      return word
    end  
  end
end