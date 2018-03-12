class RemoveStoreIdFromComment < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :comments, column: :store_id
    remove_column :comments, :store_id, :integer
  end
end
