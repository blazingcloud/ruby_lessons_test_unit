class Temperature
  def ctof(temp)
   #37°C x  9/5 + 32
    temp * 9/5.to_f + 32
  end
  def ftoc(temp)
    #(98.6°F  -  32)  x  5/9 = 37°C
    (temp - 32) * 5/9.to_f
  end
end