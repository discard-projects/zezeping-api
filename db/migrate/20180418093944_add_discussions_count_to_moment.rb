class AddDiscussionsCountToMoment < ActiveRecord::Migration[5.1]
  def change
    add_column :moments, :discussions_count, :integer, default: 0
    remove_column :moments, :comments_count
  end
end
