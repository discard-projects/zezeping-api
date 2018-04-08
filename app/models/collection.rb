class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :collectable, polymorphic: true, counter_cache: true
end
