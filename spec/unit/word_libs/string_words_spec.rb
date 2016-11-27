require_relative '../../test_helper.rb'

describe "Scratch::Interpreter string words" do

  describe '"' do
    it "collects a string onto the stack" do
      @terp = Scratch::Interpreter.new
      @terp.interprete('" Hello World "')
      assert_equal "Hello World", @terp.stack.first
    end

    it "fails when the string is incomplete" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::SyntaxError){ @terp.interprete('"') }
      assert_raises(Scratch::SyntaxError){ @terp.interprete('" Hello') }
    end
  end

  describe '#' do
    it 'denotes a comment and does nothing to the stack' do
      @terp = Scratch::Interpreter.new
      @terp.interprete('# Hello World #')
      assert_empty @terp.stack
    end

    it "fails when the comment is not closed" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::SyntaxError){ @terp.interprete('#') }
      assert_raises(Scratch::SyntaxError){ @terp.interprete('# Hello') }
    end
  end
end