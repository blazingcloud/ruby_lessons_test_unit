require "hello"
require "test/unit"

class HelloTest < Test::Unit::TestCase

  def test_says_hello
    h = Hello.new
    assert_equal 'hello', h.message, "should say 'hello'"
  end
end