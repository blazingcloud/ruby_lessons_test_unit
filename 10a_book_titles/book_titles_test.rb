require 'book'
require 'test/unit'

class BookTitlesTest < Test::Unit::TestCase
  def setup
    @book = Book.new
  end

  def test_capitalize_the_first_letter
    assert_equal "Inferno", @book.title('inferno'), "the book title should be 'Inferno'"
  end

  def test_capitalize_every_word
    assert_equal "Stuart Little", @book.title('stuart little'), "the book title should be 'Stuart Little'"
  end

    # let's pretend that the rule is for words of 3 characters or less
  def test_capitalize_all_but_small_words_like_the
    assert_equal "Alexander the Great", @book.title('alexander the great'), "the book title should be 'Alexander the Great'"
  end

  def test_capitalize_all_but_small_words_like_a
      assert_equal "To Kill a Mockingbird", @book.title('to kill a mockingbird'), "the book title should be 'To Kill a Mockingbird'"
  end

  def test_always_capitalize_I
    assert_equal "What I Wish", @book.title('what i wish'), "the book title should be 'What I Wish'"
  end

  def test_always_capitalize_I
    assert_equal "What I Wish I Knew When I was 20", @book.title('what i wish i knew when i was 2'), "the book title should be 'What I Wish I Knew When I was 20'"
  end
end