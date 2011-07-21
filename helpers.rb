
require './date'

helpers do
  
  def exit_if_shared_secret_not_present 
    
    halt if !settings.shared_secret.empty?  && settings.shared_secret.eql?( env['HTTP_USERNAME'] ) == false
  
  end
  
  def log_into_google_analytics 

    @session = @session || Garb::Session.login(settings.ga_username, settings.ga_password)
    
  end  
  
  def all_profiles
  
    @all_profiles = @all_profiles || Garb::Management::Profile.all
    
  end

  def profile_from_site_id(site_id)

    all_profiles.detect{ |p| p.web_property_id == site_id.upcase }

  end

  def metrics_for_dates(site_profile, metric, start_date, end_date = nil)
    
    end_date = start_date if end_date.nil?

    # start_date: The date of the period you would like this report to start
    # end_date: The date to end, inclusive
    # limit: The maximum number of results to be returned
    # offset: The starting index

    # http://code.google.com/apis/analytics/docs/gdata/gdataReferenceD  imensionsMetrics.html
    # ga:date	The date of the visit. An integer in the form YYYYMMDD  

    pm = site_profile.metrics :start_date => start_date, :end_date => end_date

    if pm.total_results > 0
      
      case metric
        
      when :visitors
          return pm.first.visitors
        
      when :percent_new_visits
            return pm.first.percent_new_visits

      when :avg_time_on_site
            return pm.first.avg_time_on_site

      when :pageviews_per_visit
            return pm.first.pageviews_per_visit

      when :unique_pageviews
            return pm.first.unique_pageviews

      when :visit_bounce_rate
            return pm.first.visit_bounce_rate

      else        
            raise "Unknown metric"
        
      end
      
    end

  end
  
end