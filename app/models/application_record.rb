class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Footprintable
  has_footprint(except: [:updated_at, :created_at, :tokens])
end
