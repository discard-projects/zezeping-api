class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store, counter_cache: true

  after_commit :update_store, on: :create

  private

  def update_store
    store.update(rank: store.comments.average(:rank))
    store.store_detail.update({
      rank_taste: store.comments.average(:rank_taste),
      rank_env: store.comments.average(:rank_env),
      rank_service: store.comments.average(:rank_service)
    })
  end
end
