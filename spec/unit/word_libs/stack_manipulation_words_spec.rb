require_relative '../../test_helper.rb'

describe "Scratch::Interpreter stack manipulation words" do

  describe "DUP" do
    it "duplicates top item on the stack" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("1 DUP")
      assert_equal ["1","1"], @terp.stack
    end

    it "fails when there are no words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::EmptyStackError){ @terp.interprete("DUP") }
    end
  end

  describe "SWAP" do
    it "swaps the top 2 items on the stack" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("1 2 SWAP")
      assert_equal ["2","1"], @terp.stack
    end

    it "fails when there are less than 2 words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::FewArgumentsError){ @terp.interprete("1 SWAP") }
    end 
  end

  describe "DROP" do
    it "drops the top item from the stack" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("1 2 drop")
      assert_equal ["1"], @terp.stack
    end
  end

  describe "DROPSTACK" do
    it "drops the top item from the stack" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("1 2 dropstack")
      assert_empty @terp.stack
    end
  end
end