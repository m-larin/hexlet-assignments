# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  result = (start..stop).to_a.map do |item|
    if (item % 3).zero? && (item % 5).zero?
      'FizzBuzz'
    elsif (item % 3).zero?
      'Fizz'
    elsif (item % 5).zero?
      'Buzz'
    else
      item
    end
  end

  result.empty? ? nil : result.join(' ')
end
# END
