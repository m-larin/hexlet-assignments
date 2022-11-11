# frozen_string_literal: true

# BEGIN

require 'date'

def count_by_years(users)
  users.each_with_object({}) do |user, res|
    next unless user[:gender].eql? 'male'

    year = Date.strptime(user[:birthday], '%Y-%m-%d').year.to_s
    res[year] ||= 0
    res[year] += 1
  end
end
# END
