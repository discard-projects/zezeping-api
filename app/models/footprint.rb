class Footprint < ActiveRecord::Base
  belongs_to :trackable, polymorphic: true
  belongs_to :actorable, polymorphic: true
end
