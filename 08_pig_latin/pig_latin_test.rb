require "pig_latin_translator"
require "test/unit"


class PigLatinTest < Test::Unit::TestCase
  include PigLatinTranslator

  def test_translate_a_simple_word
    assert_equal "ixnay", s = translate('nix'), "should say 'ixnay'"
  end

  def test_translate_a_word_beginning_with_a_vowel
    fail "pending"
    assert_equal "appleay", s = translate("apple"), "should say 'appleay'"
  end

  def test_translate_a_two_consonant_word
    fail "pending"
    assert_equal "upidstay", s = translate("stupid"), "should say 'upidstay'"
  end

  def test_translate_two_words
    fail "pending"
    assert_equal "eatay iepay", s = translate("eat pie"), "should say 'eatay iepay'"
  end

  def test_translate_multiple_words
    fail "pending"
    assert_equal "ethay ickquay ownbray oxfay", s = translate("the quick brown fox"), "should say 'ethay ickquay ownbray oxfay'"
  end
end
