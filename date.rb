
require 'date'

class Date
  
  def self.yesterday
    today - 1
  end

  def self.last_sunday

    d = yesterday
    until d.wday == 0
      d -= 1
    end

    d

  end

  def self.a_week_last_monday

    last_sunday - 6

  end

  def self.start_of_month

    Date.civil(today.year, today.month, 1)

  end

  def self.start_of_year

    Date.civil(today.year, 1, 1)

  end
    
  def self.method_missing(method_id, *arguments)    
    
    match = /^([_a-zA-Z]+)_a_year_ago$/.match(method_id.to_s)
    
    raise NoMethodError unless match
    
    self.send( match.captures[0].to_sym ) << 12
    
  end
    
end
