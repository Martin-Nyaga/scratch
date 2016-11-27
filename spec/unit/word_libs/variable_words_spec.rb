require_relative '../../test_helper.rb'

describe "Scratch::Interpreter variables" do

  describe "VAR" do
    it "expects an identifier" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::SyntaxError){ @terp.interprete("VAR") }
    end

    it "creates a variable" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("VAR A")
      assert @terp.dictionary.key? "A"
    end
  end

  describe "STORE" do
    it "stores a variable" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("VAR A 10 A STORE A")
      assert_equal "10", @terp.stack.last[:value]
    end

    it "blows up with no variable" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::FewArgumentsError){ @terp.interprete("STORE") }
    end
  end

  describe "FETCH" do
    it "pushes a variable on to the stack" do
      @terp = Scratch::Interpreter.new
      @terp.interprete("VAR A 10 A STORE A FETCH")
      assert_equal "10", @terp.stack.last
    end

    it "blows up with no variable" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::EmptyStackError){ @terp.interprete("FETCH") }
    end
  end
end