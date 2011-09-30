require "calculator"
require "test/unit"

class CalculatorTest < Test::Unit::TestCase
  def test_should_have_a_default_name
    calculator_object = Calculator.new
    actual_name = calculator_object.name
    assert_equal "no name", actual_name, " should be 'no name'"
  end

  def test_should_display_number_of_calculations
    calculator_object = Calculator.new
    actual_num_calculations = calculator_object.num_calculations
    assert_equal 0, actual_num_calculations, "starts out at zero"
  end

  def test_should_add_0_and_0_and_return_0
     calculator_object = Calculator.new
      actual_add = calculator_object.add(0,0)
     assert_equal 0, actual_add, "should add 0 + 0"
  end

  def test_should_add_1_and_3_and_return_4
     calculator_object = Calculator.new
     actual_add = calculator_object.add(1,3)
     assert_equal 4, actual_add, "should add 1 + 3"
  end

  def test_should_allow_specifying_a_name_when_created
    calculator_object = Calculator.new("Cool Calculator")
    actual_name = calculator_object.name
    assert_equal "Cool Calculator", actual_name, " should be 'Cool Calculator'"
  end

  def test_should_increment_the_number_of_calculations
    calculator_object = Calculator.new
    calculator_object.add(1,1)
    assert_equal 1, calculator_object.num_calculations, "should equal 1'"
  end
end