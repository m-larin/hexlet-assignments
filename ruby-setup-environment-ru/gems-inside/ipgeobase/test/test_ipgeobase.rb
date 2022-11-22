# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/ipgeobase'
require 'addressable/template'
require 'webmock/minitest'
require 'bigdecimal/util'

class TestIpgeobase < Minitest::Test
  def setup
    uri_template = Addressable::Template.new 'http://ip-api.com:80/xml/{ip}'
    xml = %(<?xml version="1.0" encoding="UTF-8"?>
    <query>
      <status>success</status>
      <country>United States</country>
      <countryCode>US</countryCode>
      <region>VA</region>
      <regionName>Virginia</regionName>
      <city>Ashburn</city>
      <zip>20149</zip>
      <lat>39.03</lat>
      <lon>-77.5</lon>
      <timezone>America/New_York</timezone>
      <isp>Google LLC</isp>
      <org>Google Public DNS</org>
      <as>AS15169 Google LLC</as>
      <query>8.8.8.8</query>
    </query>
    )
    error_xml = %(<?xml version="1.0" encoding="UTF-8"?>
    <query>
      <status>fail</status>
      <message>Private range</message>
    </query>
    )
    stub_request(:get, uri_template)
      .to_return do |request|
        uri_info = uri_template.extract(request.uri)
        case uri_info['ip']
        when '8.8.8.9'
          puts uri_info['ip']
          { body: xml, status: 200 }
        when '172.16.0.100'
          puts uri_info['ip']
          { body: error_xml, status: 200 }
        end
      end
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup
    ip_meta = Ipgeobase.lookup('8.8.8.9')
    assert { ip_meta.city == 'Ashburn' }
    assert { ip_meta.country == 'United States' }
    assert { ip_meta.countryCode == 'US' }
    assert { ip_meta.lat.to_d == 39.03.to_d }
    assert { ip_meta.lon.to_d == -77.5.to_d }

    assert_raises { Ipgeobase.lookup('172.16.0.100') }
  end
end
