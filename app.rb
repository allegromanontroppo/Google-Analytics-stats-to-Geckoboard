require 'rubygems'
require 'sinatra'
require 'garb'
require 'json'

require './config'
require './models'
require './helpers'
require './date'

before  do
  
  exit_if_shared_secret_not_present
  
end
    
    
get '/' do
  
end

get '/ga/:site_id/:metric/:period' do
  
  begin
  
    log_into_google_analytics
    profile = profile_from_site_id params[:site_id]  
    raise "Profile not found" if profile.nil?
    
    date_bounds = date_range_boundaries params[:period]
      
    items = []
    items << { :text => date_bounds[:this_year][:label], :value => metrics_for_dates(profile, params[:metric], date_bounds[:this_year][:dates].first, date_bounds[:this_year][:dates].last) }
    items << { :text => date_bounds[:last_year][:label], :value => metrics_for_dates(profile, params[:metric], date_bounds[:last_year][:dates].first, date_bounds[:this_year][:dates].last) }  
    
    { :item => items }.to_json
  
  rescue String => message

    [400, message]

  end
  
end
    
