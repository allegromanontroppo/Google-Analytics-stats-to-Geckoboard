configure do       
  
  # set up for Heroku http://devcenter.heroku.com/articles/config-vars
  set :ga_username   => ENV['GA_USERNAME']   || ''
  set :ga_password   => ENV['GA_PASSWORD']   || ''
  set :shared_secret => ENV['SHARED_SECRET'] || ''
      
end