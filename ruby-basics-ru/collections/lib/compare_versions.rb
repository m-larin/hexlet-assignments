# frozen_string_literal: true

# BEGIN
def compare_versions(ver1, ver2)
  maj1, min1 = ver1.split('.').map(&:to_i)
  maj2, min2 = ver2.split('.').map(&:to_i)

  if maj1 > maj2 || (maj1 == maj2 && min1 > min2)
    1
  elsif maj1 < maj2 || (maj1 == maj2 && min1 < min2)
    -1
  else
    0
  end
end
# END
