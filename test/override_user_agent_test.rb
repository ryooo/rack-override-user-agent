$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'rack'
require 'cgi'
require 'rack/test'
require 'rack/override_user_agent'
require 'test/unit'

IPHONE_UA = 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A403 Safari/8536.25'
ENC_IPHONE_UA = CGI::escape(IPHONE_UA)

class RackOverrideUserAgentTestNoOption < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    app = Rack::Builder.new do
      use Rack::OverrideUserAgent
      run lambda {|env| [200, {}, ["ua is #{env['HTTP_USER_AGENT']}"]]}
    end
    app
  end

  def test_should_override_user_agent_by_query
    get "/?rack-override-user-agent=#{ENC_IPHONE_UA}"
    assert_equal "ua is #{IPHONE_UA}", last_response.body
    assert_equal "rack-override-user-agent=#{ENC_IPHONE_UA}", last_response.header["Set-Cookie"]
  end

  def test_should_override_user_agent_by_cookie
    set_cookie "rack-override-user-agent=#{ENC_IPHONE_UA}"
    get "/"
    assert_equal "ua is #{IPHONE_UA}", last_response.body
    assert_equal nil, last_response.header["Set-Cookie"]
  end

  def test_should_rm_cookie
    get "/?rack-override-user-agent-rm="
    assert_equal "rack-override-user-agent=; expires=Thu, 01-Jan-1970 00:00:00 GMT", last_response.header["Set-Cookie"]
  end
end


class RackOverrideUserAgentTestPresetUa < Test::Unit::TestCase
  include Rack::Test::Methods
  def app
    app = Rack::Builder.new do
      use Rack::OverrideUserAgent, :preset_ua => {:my_sp => 'my smart phone ua'}
      run lambda {|env| [200, {}, ["ua is #{env['HTTP_USER_AGENT']}"]]}
    end
    app
  end

  def test_should_override_user_agent_by_settings_and_query
    get "/?rack-override-user-agent=my_sp"
    assert_equal "ua is my smart phone ua", last_response.body
    assert_equal "rack-override-user-agent=my+smart+phone+ua", last_response.header["Set-Cookie"]
  end
end


class RackOverrideUserAgentTestParamsKey < Test::Unit::TestCase
  include Rack::Test::Methods
  def app
    app = Rack::Builder.new do
      use Rack::OverrideUserAgent, :params_key => 'hogehoge'
      run lambda {|env| [200, {}, ["ua is #{env['HTTP_USER_AGENT']}"]]}
    end
    app
  end

  def test_should_override_user_agent_by_query
    get "/?hogehoge=#{ENC_IPHONE_UA}"
    assert_equal "ua is #{IPHONE_UA}", last_response.body
    assert_equal "hogehoge=#{ENC_IPHONE_UA}", last_response.header["Set-Cookie"]
  end
end