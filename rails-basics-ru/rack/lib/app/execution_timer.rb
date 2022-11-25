# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN

    start = Time.now
    code, headers, body = @app.call(env)
    finish = Time.now

    body << "Excecute time #{get_duration(start, finish)} us"

    [code, headers, body]
    # END
  end

  def get_duration(start, finish)
    result = (finish - start) * 1_000_000
    result += finish.usec > start.usec ? finish.usec - start.usec : finish.usec + 1_000_000 - start.usec
    result
  end
end
