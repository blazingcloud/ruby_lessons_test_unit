class Simon
  def echo(something)
    something
  end

  def shout

  end

  def repeat(something, number = 2)
    out =  []
    number.times do
      out.push something
    end
    out.join(' ')
  end

  def first_word

  end

  def start_of_word

  end
end