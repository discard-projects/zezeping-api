class AddMomentsCountToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :moments_count, :integer, default: 0
  end
end
