# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = ''
  str.each_char do |char|
    result = char + result
  end
  result
end
# END
