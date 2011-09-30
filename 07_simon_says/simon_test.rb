require "simon"
require "test/unit"

class SimonTest < Test::Unit::TestCase
  def setup
    @simon = Simon.new
  end

  def test_echo_hello
    assert_equal "hello", @simon.echo("hello"), "echo should say 'hello'"
  end

  def test_echo_bye
    assert_equal "bye", @simon.echo("bye"), "echo should say 'bye'"
  end

  def test_shout_hello
    assert_equal "HELLO", @simon.shout("hello"), "should shout 'HELLO'"
  end

  def test_shout_multiple_words
    assert_equal "HELLO WORLD", @simon.shout("hello world"), "should shout 'HELLO WORLD'"
  end

  def test_should_repeat
   assert_equal "hello hello", @simon.repeat("hello"), "should say 'hello hello'"
  end

  def test_repeat_a_number_of_times
    assert_equal "hello hello hello", @simon.repeat("hello", 3), "should say 'hello hello hello'"
  end

  def test_return_the_first_letter
    assert_equal "h", @simon.first_word("Hello World"), "should say 'h'"
  end

  def test_return_first_two_letters
    assert_equal "Bo", @simon.start_of_word("Bob", 2), "should say 'Bo'"
  end

  def test_tell_first_word_is_Hello
    assert_equal "Hello", @simon.first_word("Hello World"), "should say 'Hello'"
  end

  def test_tell_first_word_is_oh
    assert_equal "oh", @simon.first_word("oh dear"), "should say 'oh'"
  end
end