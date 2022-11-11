# frozen_string_literal: true

# BEGIN
def get_same_parity(arr)
  arr.filter do |item|
    (arr[0].even? && item.even?) || (arr[0].odd? && item.odd?)
  end
end
# END
