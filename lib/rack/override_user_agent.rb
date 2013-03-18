module Rack
  autoload :OverrideUserAgent, 'rack/override-user-agent'
  class OverrideUserAgent
    def initialize(app, options = {})
      @app = app
      @params_key = options[:params_key] || 'rack-override-user-agent'
      @params_key = @params_key.to_s
      @preset_ua = options[:preset_ua] || {}
    end

    def call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new
      if ua = request.params["#{@params_key}-rm"]
        response.delete_cookie(@params_key)
      elsif ua = request.params[@params_key]
        ua = @preset_ua[ua.to_sym] || @preset_ua[ua.to_s] || ua
        env['HTTP_USER_AGENT'] = ua
        response.set_cookie(@params_key, ua)
      elsif ua = request.cookies[@params_key]
        env['HTTP_USER_AGENT'] = ua
      end
      
      status, headers, body = @app.call(env)
      response.status = status
      headers.map {|key, value| response[key] = value}
      response.body = body
      response.finish
    end
  end
end
