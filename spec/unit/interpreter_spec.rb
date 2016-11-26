require_relative '../test_helper.rb'

describe Scratch::Interpreter do
  it "adds numbers onto the stack" do
    @terp = Scratch::Interpreter.new
    @terp.interprete("1")
    assert_equal ["1"], @terp.stack
  end

  it "fails with unknown words" do
    @terp = Scratch::Interpreter.new
    assert_raises(Scratch::UnknownWordError){ @terp.interprete("foo") }
  end

  it "drops stack" do
    @terp = Scratch::Interpreter.new
    @terp.interprete("1")
    @terp.drop_stack!
    assert_empty @terp.stack    
  end

  it "adds words to dictionary" do
    @terp = Scratch::Interpreter.new
    @terp.add_words({ "BAR" => "Hello World" })
    assert(@terp.dictionary.key? "BAR")
  end

  it "can start in interactive mode" do
    @terp = Scratch::Interpreter.new(interactive: true)
    assert @terp.interactive
  end
end