# rack-override-user-agent

1. rack-override-user-agent will override user agent by cookie.
2. You can set the cookie by url query.
3. You will be free from browser extension that override user agent.

# How to use

## Install

    $ gem install rack-override-user-agent
    $ bundle install

## Default usage

### config.ru
    use Rack::OverrideUserAgent

### Access by browser
    http://domain.of.your.app/?rack-override-user-agent="encoded user agent"
    
    ex)
    http://localhost:3000/?rack-override-user-agent=Mozilla%2F5.0+%28iPhone%3B+CPU+iPhone+OS+6_0+like+Mac+OS+X%29

##### After first access, all subsequent access user agent will be overridden without url query.

## Options usage

### config.ru
    use Rack::OverrideUserAgent,
      :params_key => :ua,
      :preset_ua => {
        :iphone => 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X)',
      }

### Access by browser
    http://domain.of.your.app/?ua=iphone
    
    ex)
    http://localhost:3000/?ua=iphone

##### After first access, all subsequent access user agent will be overridden without url query.


## Contributing to rack-override-user-agent
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 ryooo321. See LICENSE.txt for further details.
