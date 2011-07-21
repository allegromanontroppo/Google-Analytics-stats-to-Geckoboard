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

get '/ga/:site_id/:metric/day' do
  
  begin
  
    log_into_google_analytics
    profile = profile_from_site_id params[:site_id]  
    raise "Profile not found" if profile.nil?
  
    yesterday            = metrics_for_dates profile, params[:metric].to_sym, Date.yesterday
    a_year_ago_yesterday = metrics_for_dates profile, params[:metric].to_sym, Date.a_year_ago_yesterday  
    
    items = []
    items << { :text => 'Yesterday', :value => yesterday}
    items << { :text => 'Last Year', :value => a_year_ago_yesterday}    
    
    { :item => items }.to_json
  
  rescue String => message

    [400, message]

  end
  
end

get '/ga/:site_id/:metric/week' do
  
  begin

    log_into_google_analytics
    profile = profile_from_site_id params[:site_id]
    raise "Profile not found" if profile.nil?

    last_week           = metrics_for_dates profile, params[:metric].to_sym, Date.a_week_ago_yesterday, Date.yesterday
    last_week_last_year = metrics_for_dates profile, params[:metric].to_sym, Date.a_year_ago_a_week_ago_yesterday, Date.a_year_ago_yesterday
    
    items = []
    items << { :text => 'Last Week', :value => last_week}
    items << { :text => 'Last year', :value => last_week_last_year}
    
    { :item => items }.to_json

  rescue String => message

    [400, message]

  end

end
    
