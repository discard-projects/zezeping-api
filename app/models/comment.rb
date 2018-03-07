class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store, counter_cache: true
  has_many :attachment_images, as: :owner, dependent: :destroy

  after_commit :update_store, on: :create

  private

  def update_store
    store.update({
       rank: store.comments.average(:rank) || 0,
       per_expense: store.comments.average(:per_expense) || 0
    })
    store.store_detail.update({
      rank_taste: store.comments.average(:rank_taste) || 0,
      rank_env: store.comments.average(:rank_env) || 0,
      rank_service: store.comments.average(:rank_service) || 0
    })
  end
end
