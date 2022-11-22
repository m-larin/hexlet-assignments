# frozen_string_literal: true

require_relative 'ipgeobase/version'
require 'net/http'
require 'happymapper'

module Ipgeobase
  class Error < StandardError; end
  # Your code goes here...

  class Meta
    attr_accessor :city, :country, :countryCode, :lat, :lon
  end

  def self.lookup(ip)
    url = URI("http://ip-api.com/xml/#{ip}")

    response = Net::HTTP.get(url)
    data = HappyMapper.parse(response)

    raise "Error on ip-api service: #{data.message}" unless data.status == 'success'

    result = Meta.new

    result.city = data.city
    result.country = data.country
    result.countryCode = data.country_code
    result.lat = data.lat.to_f
    result.lon = data.lon.to_f

    result
  end
end
