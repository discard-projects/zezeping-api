class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :discussable, polymorphic: true, counter_cache: true
  has_many :votes, :as => :voteable

  def is_approved
    votes.exists?(user: Current.user)
  end
end
