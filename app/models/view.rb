class View < ApplicationRecord
  belongs_to :viewable, polymorphic: true, counter_cache: true
  belongs_to :user, optional: true

  validates :ip, presence: true

  #  class method
  def self.try_add_for_viewable viewable
    viewable.views.day_range_column(:created_at).find_or_create_by(ip: Current.remote_ip) do |view|
      view.user = Current.user
    end
  end
end
