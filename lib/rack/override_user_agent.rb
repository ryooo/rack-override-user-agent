module Rack
  class OverrideUserAgent
    def initialize(app, options = {})
      @app = app
      @params_key = options[:params_key] || 'rack-override-user-agent'
      @params_key = @params_key.to_s
      @preset_ua = options[:preset_ua] || {}
    end

    def call(env)
      request = Rack::Request.new(env)
      cookie_controll = nil
      if ua = request.params["#{@params_key}-rm"]
        cookie_controll = :delete
      elsif ua = request.params[@params_key]
        ua = @preset_ua[ua.to_sym] || @preset_ua[ua.to_s] || ua
        env['HTTP_USER_AGENT'] = ua
        cookie_controll = :set
      elsif ua = request.cookies[@params_key]
        env['HTTP_USER_AGENT'] = ua
      end
      
      status, headers, body = @app.call(env)
      response = Rack::Response.new
      response.status = status
      headers.map {|key, value| response[key] = value}
      response.body = body
      
      case cookie_controll
      when :delete
        response.set_cookie(@params_key, {:path => '/'})
      when :set
        response.set_cookie(@params_key, {:value => ua, :path => '/'})
      end
      
      response.finish
    end
  end
end
