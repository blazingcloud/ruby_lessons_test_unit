class Simon
  def echo(something)
    something
  end

  def shout(something)
     something.upcase
  end

  def repeat(something, number = 2)
    out =  []
    number.times do
      out.push something
    end
    out.join(' ')
  end

  def first_word(sentence)
    sentence.split(' ').first
  end

  def start_of_word(word, number)
    word[0..number-1]
  end
end