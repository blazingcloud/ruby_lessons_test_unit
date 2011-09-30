require 'xml_document'
require 'test/unit'

class XmlDocumentTest < Test::Unit::TestCase
  def setup
      @xml = XmlDocument.new
    end

    def test_renders_an_empty_tag
      @xml.hello.should == "<hello/>"
    end

    def test_renders_a_tag_with_attributes
      @xml.hello(:name => 'dolly').should == "<hello name='dolly'/>"
    end

    def test_renders_a_tag_with_other_attributes
      @xml.hello(:foo => 'bar').should == "<hello foo='bar'/>"
    end

    def test_renders_a_randomly_named_tag
      tag_name = (1..8).map{|i| ('a'..'z').to_a[rand(26)]}.join
      @xml.send(tag_name).should == "<#{tag_name}/>"
    end

    def test_renders_a_randomly_named_tag_with_contents
      tag_name = (1..8).map{|i| ('a'..'z').to_a[rand(26)]}.join
      @xml.send(tag_name) do
        "stuff"
      end.should == "<#{tag_name}>stuff</#{tag_name}>"
    end

    def test_renders_block_with_text_inside
      @xml.hello do
        "dolly"
      end.should == "<hello>dolly</hello>"
    end

    def test_nests_one_level
      @xml.hello do
        @xml.goodbye
      end.should == "<hello><goodbye/></hello>"
    end

    def test_nests_several_levels
      @xml.hello do
        @xml.goodbye do
          @xml.come_back do
            @xml.ok_fine(:be => "that_way")
          end
        end
      end.should == "<hello><goodbye><come_back><ok_fine be='that_way'/></come_back></goodbye></hello>"
    end

    def test_indents_one_level
      @xml = XmlDocument.new(true)
      @xml.hello do
        @xml.goodbye
      end.should ==
      "<hello>\n" +
      "  <goodbye/>\n" +
      "</hello>\n"
    end


    def test_indents
      @xml = XmlDocument.new(true)
      @xml.hello do
        @xml.goodbye do
          @xml.come_back do
            @xml.ok_fine(:be => "that_way")
          end
        end
      end.should ==
      "<hello>\n" +
      "  <goodbye>\n" +
      "    <come_back>\n" +
      "      <ok_fine be='that_way'/>\n" +
      "    </come_back>\n" +
      "  </goodbye>\n" +
      "</hello>\n"
    end


end