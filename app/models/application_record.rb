class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.year_now
    Time.new.year
  end
end
