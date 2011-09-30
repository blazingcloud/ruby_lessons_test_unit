require "calculator"
require "test/unit"

class CalculatorAdvancedTest < Test::Unit::TestCase
  def setup
    @calculator = Calculator.new
  end

  def test_computes_the_sum_of_an_empty_array

    assert_equal 0 , @calculator.sum([]) ,"sum of empty array is zero"
  end
  def test_computes_the_sum_of_an_array_of_one_number

    assert_equal 7 , @calculator.sum([7]) ,"sum of array is seven"
  end
  def test_computes_the_sum_of_an_array_of_two_numbers

    assert_equal 18 , @calculator.sum([7,11]) ,"sum of the array is eighteen"

  end
  def test_computes_the_sum_of_an_array_of_many_numbers
      assert_equal 25 , @calculator.sum([1,3,5,7,9]) ,"sum of the array is twenty-five"
  end
end