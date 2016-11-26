require_relative '../../test_helper.rb'

describe "Scratch::Interpreter math words" do

  describe "+" do
    it "adds top two numbers from stack it" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("1 1 +")
      assert_equal 2, @terp.stack.last
    end

    it "fails when there are no words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::FewArgumentsError){ @terp.interprete("1 +") }
    end
  end

  describe "-" do
    it "subtracts top two numbers from stack it" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("3 1 -")
      assert_equal 2, @terp.stack.last
    end

    it "fails when there are no words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::FewArgumentsError){ @terp.interprete("-") }
    end
  end

  describe "*" do
    it "multiplies top two numbers from stack it" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("3 2 *")
      assert_equal 6, @terp.stack.last
    end

    it "fails when there are no words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::FewArgumentsError){ @terp.interprete("*") }
    end
  end

  describe "/" do
    it "divides top two numbers from stack it" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("6 2 /")
      assert_equal 3, @terp.stack.last
    end

    it "fails when there are no words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::FewArgumentsError){ @terp.interprete("/") }
    end
  end

  describe "sqrt" do
    it "gets the square root of the last number on the stack" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("9 sqrt")
      assert_equal 3, @terp.stack.last
    end

    it "fails when there are no words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::EmptyStackError){ @terp.interprete("sqrt") }
    end
  end
end