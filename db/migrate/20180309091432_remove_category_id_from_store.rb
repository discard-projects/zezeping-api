class RemoveCategoryIdFromStore < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :stores, column: :category_id
    remove_column :stores, :category_id, :integer
  end
end
