# frozen_string_literal: true

require 'uri'

# BEGIN
class Url
  include Comparable

  attr :uri

  def <=>(other)
    uri <=> other.uri
  end

  def initialize(url)
    @uri = URI(url)
  end

  def host
    @uri.host
  end

  def scheme
    @uri.scheme
  end

  def query_params
    result = {}
    params_as_str = @uri.query
    unless params_as_str.nil?
      params_arr = params_as_str.split '&'
      params_arr.each do |item|
        param = item.split '='
        result[param[0].to_sym] = param[1]
      end
    end
    result
  end

  def query_param(key, default = nil)
    result ||= query_params[key]
    result ||= default
    result
  end
end
# END
