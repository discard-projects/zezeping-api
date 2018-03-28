class AddVotesCountAndViewsCountToMoment < ActiveRecord::Migration[5.1]
  def change
    add_column :moments, :views_count, :integer, default: 0
    add_column :moments, :votes_count, :integer, default: 0
  end
end
