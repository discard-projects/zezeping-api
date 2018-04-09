class AddCategoryToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :category, :integer, limit: 1, default: 0
  end
end
