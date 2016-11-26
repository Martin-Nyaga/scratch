require_relative '../test_helper.rb'

describe Scratch::Lexer do
  before do
    @lexer = Scratch::Lexer.new("Hello World")
  end

  it "initializes" do
    assert_equal ["Hello", "World"], @lexer.words 
    assert_equal 0, @lexer.next
  end

  it "gets the next word" do
    assert_equal "Hello", @lexer.next_word
    assert_equal 1, @lexer.next
    assert_equal "World", @lexer.next_word
    assert_equal 2, @lexer.next
    assert_equal nil, @lexer.next_word
  end
end