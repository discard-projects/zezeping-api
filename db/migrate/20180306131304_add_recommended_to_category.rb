class AddRecommendedToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :recommended, :boolean, default: false
  end
end
