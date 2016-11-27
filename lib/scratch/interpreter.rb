module Scratch
  class Interpreter
    attr_accessor :dictionary, :stack, :interactive, :lexer
    
    # Start the interpreter with options
    # @param opts [Hash] Options for the interpreter. 
    #   Only option so far is interactive mode
    def initialize(opts = {})
      @dictionary = {}
      @stack = []
      @interactive = opts[:interactive]
      @debug = opts[:debug]

      load_all_words
    end

    # Add new words to the dictionary
    # @param new_dict [Hash] Hash of new words
    def add_words new_dict
      @dictionary = @dictionary.inject(new_dict) do |dict, (k,v)|
        dict.merge({ k.upcase => v }) 
      end
    end

    def build_lexer(text)
      @lexer = Scratch::Lexer.new(text)
    end

    # Iterprete some text
    # @param text [String] The text to be interpreted
    def interprete text
      # initialize lexer
      build_lexer(text)
      
      # loop through words given by lexer
      while word = @lexer.next_word do
        word = word.upcase

        # if word is present in dictionary, call the function
        if dictionary[word]
          @dictionary[word].call(self)

        # if word is number, push to stack
        elsif is_number? word
          @stack.push(word)

        # raise for unknown keywords
        else
          raise UnknownWordError, "Unknown word: #{word}"
        end
      end

      print_debug_info if @interactive && @debug

    # Don't raise errors in interactive mode.
    rescue => e
      if @interactive
        puts "  An error occurred: #{e.class}".red.bold
        puts "     #{e.message}"
        puts "     Stack: #{@stack.join(Scratch::STACK_DELIMITER.blue)}"
      else
        raise e, e.message
      end
    end

    # Print debug information in debug mode
    def print_debug_info
      puts 
      puts "==== DEBUG INFORMATION ====".cyan.bold
      puts "Stack:".cyan.bold
      print @stack.join(Scratch::STACK_DELIMITER.blue)
      puts
      puts "Dict:".cyan.bold
      pp @dictionary
    end

    # Clear the stack
    def drop_stack!
      @stack = []
    end

    private
      # check if a number is a string
      def is_number? string
        true if Float(string) rescue false
      end
  end

  # Unknown word errors
  class UnknownWordError < StandardError; end

  # Empty stack error
  class EmptyStackError < StandardError
    def initialize(msg = "The stack is empty")
      super(msg)
    end
  end

  # Not enough words on stack error
  class FewArgumentsError < StandardError;  end

  # Syntax error
  class SyntaxError < StandardError; end
end
