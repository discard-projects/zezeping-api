class Store < ApplicationRecord
  geocoded_by :address, :latitude  => :lat, :longitude => :lng
  after_validation :geocode

  mount_uploader :logo, ImageUploader

  enum status: { status_created: 0, status_pended: 1, status_checked: 2, status_failed: 3 }
  ransacker :status, formatter: proc { |v| statuses[v] }

  # belongs_to :category, optional: true
  # http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#label-Association+callbacks
  has_and_belongs_to_many :categories, after_remove: Proc.new { |store, category| store.product_categories.where(category: category).update_all(category_id: nil) }
  belongs_to :region, optional: true
  belongs_to :user, optional: true
  has_many :product_categories, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :moments
  has_many :comments, :as => :commentable
  has_many :attachment_images, as: :owner, dependent: :destroy
  has_one :store_detail, dependent: :destroy

  before_create :create_store_detail

  private

  def create_store_detail
    self.store_detail ||= StoreDetail.create
  end
end
