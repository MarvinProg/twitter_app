class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.year_now
    Time.zone.now.year
  end
end
