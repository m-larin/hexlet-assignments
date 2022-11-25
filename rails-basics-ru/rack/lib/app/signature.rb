# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    code, headers, body = @app.call(env)

    body << Digest::SHA256.hexdigest(body[0])

    [code, headers, body]
    # END
  end
end
