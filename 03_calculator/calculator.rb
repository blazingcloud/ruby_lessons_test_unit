class Calculator
  def initialize(name = 'no name')
    @name = name
    @counter  = 0
  end
  def name
    @name
  end
  def sum(numbers)
    numbers.inject(0) { |memo, item| memo + item}
  end
  def num_calculations
    @counter
  end

  def add(num1, num2)
    @counter = @counter + 1
    num1 + num2
  end
end