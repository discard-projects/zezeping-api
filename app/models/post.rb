class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :discussions, -> { order 'created_at asc' }, :as => :discussable
  has_many :views, :as => :viewable
  has_many :votes, :as => :voteable
  has_many :collections, :as => :collectable

  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 255 }

  def is_collected
    collections.exists?(user: Current.user)
  end

  def is_approved
    votes.exists?(user: Current.user)
  end
end
