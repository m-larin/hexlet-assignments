# frozen_string_literal: true
require 'i18n'

class SetLocaleMiddleware

  HTTP_ACCEPT_LANGUAGE_HEADER = 'HTTP_ACCEPT_LANGUAGE'
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    request = Rack::Request.new(env)
    locale = nil

    langs = request.accept_language
    langs.each do |item|
      if I18n.locale_available? item[0]
        locale = item[0]
        break
      end
    end

    I18n.locale = locale unless locale.nil?
    @app.call(env)

  end
  # END
end
