Gem::Specification.new do |s|
  s.name        = "rack-override-user-agent"
  s.version     = "0.1.0"
  s.date        = "2013-03-18"
  s.summary     = "Override user agent by cookie, switch agent cookie by url query."
  s.description = "Override user agent by cookie, switch agent cookie by url query."
  s.authors     = ["ryooo"]
  s.email       = "ryooo.321@gmail.com"
  s.homepage    = "https://github.com/ryooo321/rack-override-user-agent"
  s.files       = `git ls-files`.split($/)
  s.test_files  = ["test/override_user_agent_test.rb"]
  s.add_development_dependency "pry"
  s.add_dependency 'rack', '~> 0.4'
end
