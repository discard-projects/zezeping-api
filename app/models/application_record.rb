class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Footprintable
  has_footprint(except: [:updated_at, :created_at, :tokens])


  def updated_time
    updated_at.to_s
  end

  def created_time
    created_at.to_s
  end
end
