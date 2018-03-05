class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store, counter_cache: true

  after_commit :update_store, on: :create

  private

  def update_store
    sum_rank_taste, sum_rank_env, sum_rank_service = store.comments.pluck('sum(rank_taste)', 'sum(rank_env)', 'sum(rank_service)')[0]
    total_count = store.comments.count
    store.update(rank: store.comments.sum(:rank)/total_count)
    store.store_detail.update({
      rank_taste: sum_rank_taste / total_count,
      rank_env: sum_rank_env / total_count,
      rank_service: sum_rank_service / total_count
    })
  end
end
