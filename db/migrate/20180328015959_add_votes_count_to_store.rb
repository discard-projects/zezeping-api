class AddVotesCountToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :votes_count, :integer, default: 0
  end
end
