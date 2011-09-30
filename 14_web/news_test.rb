require 'news'
require 'test/unit'

class NewsTest < Test::Unit::TestCase
  def setup
    f = File.new("cnn.html", "r")
    FakeWeb.register_uri(:get, "http://www.cnn.com", :body => f.read)
    @news = News.new
  end

  def test_allow_you_to_set_the_uri
    @news.uri = "http://www.cnn.com"
    @news.uri.should == "http://www.cnn.com"
  end

  def test_fetch_the_page_when_you_set_the_uri
    @news.uri = "http://www.cnn.com"
    @news.source_data.should == File.new("cnn.html", "r").read
  end

  describe "#top_story
    def test_find_the_first_list_item_after_Latest_news_heading
      FakeWeb.register_uri(:get, "http://www.test1.com", :body => "<h4>Latest news</h4><ul><li><a href=\"http://something.com\">Story Name</a>")
      @news.uri = "http://www.test1.com"
      @news.top_story.should ==
        {:url => "http://something.com",
         :title => "Story Name"}
    end

    def test_return_the_first_headlines_with_url_listed_under_Latest_News_
      @news.uri = "http://www.cnn.com"
      @news.top_story.should ==
        {:url => "/2010/WORLD/americas/01/31/haiti.us.airlifts/index.html?hpt=T2",
         :title => "Evacuations of Haitians to U.S. to resume"}
    end
  end
end