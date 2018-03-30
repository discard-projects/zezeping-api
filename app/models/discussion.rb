class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :discussable, polymorphic: true, counter_cache: true
end
