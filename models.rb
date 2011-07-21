class Metrics
  extend Garb::Model

  metrics :visitors, :percent_new_visits, :avg_time_on_site, :pageviews_per_visit, :unique_pageviews, :visit_bounce_rate

end