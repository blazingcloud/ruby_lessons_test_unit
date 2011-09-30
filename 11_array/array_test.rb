require 'array_extension'
require 'test/unit'

class ArrayTest < Test::Unit::TestCase
  def test_should_be_0_for_an_empty_array
    assert_equal 0, [].sum, "empty array should be 0"
  end

  def test_should_add_all_of_the_elements
    assert_equal 7, [1,2,4].sum, "array should total 7"
  end
end