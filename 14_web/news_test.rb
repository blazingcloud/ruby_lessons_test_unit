require 'news'
require 'test/unit'
require 'rubygems'
require 'fakeweb'

class NewsTest < Test::Unit::TestCase
  def setup
    f = File.new("cnn.html", "r")
    FakeWeb.register_uri(:get, "http://www.cnn.com", :body => f.read)
    @news = News.new
  end

  def test_allow_you_to_set_the_uri
    @news.uri = "http://www.cnn.com"
    assert_equal "http://www.cnn.com", @news.uri, "should say 'http://www.cnn.com'"
  end

  def test_fetch_the_page_when_you_set_the_uri
    @news.uri = "http://www.cnn.com"
    actual_string = @news.source_data
    expected_string = File.new("cnn.html", "r").read
    assert_equal expected_string, actual_string, "should return an html page from 'http://www.cnn.com/'"
  end

  def test_find_the_first_list_item_after_latest_news_heading_top_story
    FakeWeb.register_uri(:get, "http://www.test1.com", :body => "<h4>Latest news</h4><ul><li><a href=\"http://something.com\">Story Name</a>")
    @news.uri = "http://www.test1.com"
    actual_string = @news.top_story
    expected_string = {:url => "http://something.com",
       :title => "Story Name"}
    assert_equal expected_string, actual_string, "should return a top story with a title and a URL"
  end

  def test_return_the_first_headlines_with_url_listed_under_Latest_News_top_story
    @news.uri = "http://www.cnn.com"
    actual_string = @news.top_story
    expected_string = {:url => "/2010/WORLD/americas/01/31/haiti.us.airlifts/index.html?hpt=T2",
                       :title => "Evacuations of Haitians to U.S. to resume"}
    assert_equal expected_string, actual_string, "should return a top story with a title and a URL"
  end
end