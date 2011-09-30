require "converter"
require "test/unit"

class ConverterTest < Test::Unit::TestCase
  def setup
    @converter = Converter.new
  end


  def test_converts_pound_to_h1
    @converter.markdown = %%
# heading
%
    assert_equal "h1. heading\n", @converter.textile, "should be 'h1. heading\n'"
  end

    def test_should_not_convert_pound_in_the_middle_of_line
    @converter.markdown = <<EOS
We are #1!
EOS
 assert_equal "We are #1!\n", @converter.textile, "should be 'We are #1!\n'"
  end

    def test_converts_double_pound_to_h2
    @converter.markdown = <<EOS
## heading
EOS
    assert_equal "h2. heading\n", @converter.textile, "should be 'h2. heading\n'"
  end

  def test_converts_triple_pound_to_h3
      fail "pending"
    @converter.markdown = <<EOS
### heading
EOS
    assert_equal "h3. heading\n", @converter.textile, "should be 'h3. heading\n'"
  end

  def test_converts_different_kinds_of_headings
     fail "pending"
    @converter.markdown = <<EOS
# top level heading
Here is a line without a heading
## second level
Another line with a # in it!
## another second
### thir
# top level again
EOS

    expected_textile = %%
h1. top level heading
Here is a line without a heading
h2. second level
Another line with a # in it!
h2. another second
h3. thir
#h1 top level again
%
    assert_equal expected_textile, @converter.textile, "should be <<EOS
h1. top level heading
Here is a line without a heading
h2. second level
Another line with a # in it!
h2. another second
h3. thir
h1. top level again
EOS"
  end

    def test_converts_links
      fail "pending"
    @converter.markdown = <<EOS
Here is a ![alt-text](link)
EOS

    @converter.textile.should == "Here is a !link!\n"
  end

    def test_converts_two_links
    @converter.markdown = <<EOS
![alt-text](http://blazingcloud.net) and ![alt-text](http://google.com)
EOS

    @converter.textile.should == "!http://blazingcloud.net! and !http://google.com!\n"
  end

    def test_converts_images_in_a_block_of_text_with_special_chars
    pending
    @converter.markdown = <<EOS
Here is a ![alt-text](link) in a block of text (which has [special] chars!)
EOS

    @converter.textile.should == "Here is a !link! in a block of text (which has [special] chars!)\n"
  end