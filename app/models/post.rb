class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :discussions, -> { order 'created_at asc' }, :as => :discussable
  has_many :views, :as => :viewable
  has_many :votes, :as => :voteable
  has_many :collections, :as => :collectable

  enum status: { status_created: 0, status_expired: 1, status_blocked: 2 }
  ransacker :status, formatter: proc { |v| statuses[v] }

  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 255 }

  aasm :column => :status, :enum => true do
    state :status_created, :initial => true
    state :status_expired, :status_blocked
    # event
    event :status_expired do
      transitions :from => :status_created, :to => :status_expired
    end
    event :status_blocked do
      transitions :from => [:status_created, :status_expired], :to => :status_blocked
    end
  end

  def is_collected
    collections.exists?(user: Current.user)
  end

  def is_approved
    votes.exists?(user: Current.user)
  end
end
