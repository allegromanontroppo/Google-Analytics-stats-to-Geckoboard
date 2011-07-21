
require 'date'

class Date
  
  def self.yesterday
    today - 1
  end

  def self.a_week_ago_yesterday
    yesterday - 7
  end

  def self.a_year_ago_yesterday
    yesterday << 12
  end

  def self.a_year_ago_a_week_ago_yesterday
    a_year_ago_yesterday - 7
  end
    
end
