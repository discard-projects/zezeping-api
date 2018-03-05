class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store, counter_cache: true
end
