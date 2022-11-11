# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  param_keys = params.keys.sort

  result = []
  param_keys.each do |key|
    result << "#{key}=#{params[key]}"
  end
  result.join('&')
end
# END
# rubocop:enable Style/For
