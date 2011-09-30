require 'xml_document'
require 'test/unit'

class XmlDocumentTest < Test::Unit::TestCase
  def setup
      @xml = XmlDocument.new
    end

    def test_renders_an_empty_tag
      assert_equal '<hello/>', @xml.hello, "should say '<hello/>'"
    end

    def test_renders_a_tag_with_attributes
      assert_equal "<hello name='dolly'/>", @xml.hello(:name => 'dolly'), "should return '<hello name='dolly'/>'"
    end
    def test_renders_a_tag_with_other_attributes
      assert_equal "<hello foo='bar'/>", @xml.hello(:foo => 'bar'), "should say '<hello foo='bar'/>'"
    end

    def test_renders_a_randomly_named_tag
      tag_name = (1..8).map{|i| ('a'..'z').to_a[rand(26)]}.join
      assert_equal "<#{tag_name}/>", @xml.send(tag_name), "should say '<#{tag_name}/>'"
    end

    def test_renders_a_randomly_named_tag_with_contents
      tag_name = (1..8).map{|i| ('a'..'z').to_a[rand(26)]}.join
      actual_string = @xml.send(tag_name) do
        "stuff"
      end
      expected_string = "<#{tag_name}>stuff</#{tag_name}>"
      assert_equal expected_string, actual_string , "expected formatted xml"
    end

    def test_renders_block_with_text_inside
        actual_string =  @xml.hello do
        "dolly"
      end
        expected_string =  "<hello>dolly</hello>"

      assert_equal expected_string, actual_string , "expected formatted xml"

    end

    def test_nests_one_level
      actual_string = @xml.hello do
        @xml.goodbye
      end
      expected_string = "<hello><goodbye/></hello>"

      assert_equal expected_string, actual_string , "expected formatted xml"
    end

    def test_nests_several_levels
      actual_string = @xml.hello do
        @xml.goodbye do
          @xml.come_back do
            @xml.ok_fine(:be => "that_way")
          end
        end
      end
      expected_string =  "<hello><goodbye><come_back><ok_fine be='that_way'/></come_back></goodbye></hello>"

      assert_equal expected_string, actual_string , "expected formatted xml"
    end

    def test_indents_one_level
      @xml = XmlDocument.new(true)
    actual_string = @xml.hello do
      @xml.goodbye
    end
      expected_string = "<hello>\n" +
    "  <goodbye/>\n" +
    "</hello>\n"
      assert_equal expected_string, actual_string , "expected formatted xml"
    end


    def test_indents
      @xml = XmlDocument.new(true)
      actual_string = @xml.hello do
      @xml.goodbye do
        @xml.come_back do
          @xml.ok_fine(:be => "that_way")
        end
      end
    end

    expected_string = "<hello>\n" +
    "  <goodbye>\n" +
    "    <come_back>\n" +
    "      <ok_fine be='that_way'/>\n" +
    "    </come_back>\n" +
    "  </goodbye>\n" +
    "</hello>\n"

      assert_equal expected_string, actual_string , "expected formatted xml"
    end
end