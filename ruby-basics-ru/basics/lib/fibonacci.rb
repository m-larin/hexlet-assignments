# frozen_string_literal: true

# BEGIN
def fibonacci(position)
  if position.negative?
    nil
  elsif position.zero?
    0
  elsif position == 1
    1
  else
    n1 = 1
    n2 = 0
    result = 0
    (2..position).each do
      result = n1 + n2
      n2 = n1
      n1 = result
    end
    result
  end
end
# END
