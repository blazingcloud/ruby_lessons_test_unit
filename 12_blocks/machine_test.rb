require 'machine'
require 'test/unit'

class MachineTest < Test::Unit::TestCase

def test_executes_a_block_and_returns_a_string
    result = Machine.new.do_something do
      "hello"
    end
    assert_equal 'hello', result, "should say 'hello'"
  end

  def test_executes_a_block_and_returns_a_number
    #pending
    result = Machine.new.do_something do
      3 + 4
      end
    assert_equal '7', result, "should be 7"
  end

  def test_executes_a_block_in_the_context_of_the_calling_method
    #pending
    n = 1
    result = Machine.new.do_something do
      n + 4
    end

    assert_equal '5', result, "should be 5"

  end


  def test_executes_a_block_3_times_and_returns_the_result
    #pending
    n = 5
    result = Machine.new.do_something(3) do
      n += 1
    end
    result.should == 8
    assert_equal '8', result, "should be 8"
  end
end