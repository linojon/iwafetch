class Schedule < ActiveRecord::Base
  before_save :strip_it
  def run
    search = Search.new( :service => self.service, :terms => self.terms)
    if search
      search.fetch
      self.last_run_at = search.created_at
      self.save
    end
  end
  
  def self.run_all
    schedules = self.find(:all)
    # TODO: filter by frequency, determine which should run
    schedules.each { |schedule| schedule.run }
  end
  
  def strip_it
    self.terms.strip!
    self.terms.squeeze!(" ")
  end
end
