require "timer"
require "test/unit"

class TimerTest < Test::Unit::TestCase
  def setup
    @timer = Timer.new()
  end

  def test_initialize_to_0_seconds
    assert_equal 0, @timer.seconds, "the timer should start at 0"
   end

   def test_display_0_seconds_as_string
     @timer.seconds = 0
     assert_equal "00|00|00", @timer.time_string, "the timer should display 0 as '00|00|00'"
   end

   def test_display_12_seconds_as_string
     @timer.seconds = 12
     assert_equal "00|00|12", @timer.time_string, "the timer should display 12 as '00|00|12'"

   end

   def test_display_66_seconds_as_string
     @timer.seconds = 66
     assert_equal "00|01|06", @timer.time_string, "the timer should display 66 as '00|01|06'"
   end

   def test_display_4000_seconds_as_string
    fail "pending"
     @timer.seconds = 4000
     assert_equal "01|06|40", @timer.time_string, "the timer should display 4000 as '01|06|40'"
   end
end