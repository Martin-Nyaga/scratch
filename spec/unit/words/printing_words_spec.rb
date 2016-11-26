require_relative '../../test_helper.rb'

describe "Scratch::Interpreter printing words" do

  describe "PRINT" do
    it "prints the top-most word on the stack and pops it" do
      @terp = Scratch::Interpreter.new

      out = capture_io do
        @terp.interprete("1 PRINT")
      end

      assert_equal "1", out[0].chomp
      assert_empty @terp.stack
    end

    it "fails when there are no words in the stack" do
      @terp = Scratch::Interpreter.new
      assert_raises(Scratch::EmptyStackError){ @terp.interprete("PRINT") }
    end
  end
end