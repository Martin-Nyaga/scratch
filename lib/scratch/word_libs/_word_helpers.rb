module Scratch
  module WordHelpers

    # require items on stack and raise errors otherwise
    def self.require_items_on_stack terp, items
      if terp.stack.length < items
        if items == 1
          raise EmptyStackError
        else
          raise FewArgumentsError, "Need at least #{items} items on the stack to perform this operation"
        end
      end
    end

    # Expect more words on the input
    def self.get_next_word terp
      next_word = terp.lexer.next_word
      if !next_word
        raise SyntaxError, "Unexpected end of input."
      else
        next_word
      end
    end
  end
end