Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.name              = "rack-override-user-agent"
  s.version           = "0.1.0"
  s.date              = "2013-03-18"
  s.summary           = "Override useragent by cookie, switch agent by query."
  s.description       = "Override useragent by cookie, switch agent by query."
  s.authors           = ["ryooo"]
  s.email             = "ryooo.321@gmail.com"
  s.homepage          = ""
  s.files             = ["Rakefile", "README", "lib/rack/override_user_agent.rb"]
  s.test_files        = ["test/override_user_agent_test.rb"]
  s.rubyforge_project = "rack-override-user-agent"
  s.add_development_dependency "pry"
  s.add_dependency 'rack', '~> 0.4'
end
