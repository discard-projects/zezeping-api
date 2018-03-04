class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :stores, counter_cache: true
end
