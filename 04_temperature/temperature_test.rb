require "temperature"
require "test/unit"

class TemperatureTest < Test::Unit::TestCase
  def setup
    @temperature = Temperature.new
  end

  def test_ftoc_freezing
    assert_equal 0, @temperature.ftoc(32), "the freezing temperature should be 0"
  end

  def test_ftoc_boiling
    assert_equal 100, @temperature.ftoc(212), "the boiling temperature should be 100"
  end

  def test_ftoc_body
    assert_equal 37, @temperature.ftoc(98.6), "the body temperature should be 37"
  end

  def test_ftoc_arbitrary
    assert_equal 20, @temperature.ftoc(68), "the arbitrary temperature should be 20"
  end


  def test_ctof_freezing
    assert_equal 32, @temperature.ctof(0), "the freezing temperature should be 32"
  end

  def test_ctof_boiling
    assert_equal 212, @temperature.ctof(100), "the boiling temperature should be 212"
  end

  def test_ctof_arbitrary
    assert_equal 68, @temperature.ctof(20), "the arbitrary temperature should be 68"
  end

  def test_ctof_body
    assert_in_delta 98.6, @temperature.ctof(37), 0.1, "the body temperature should be close to 98.6"
  end

end