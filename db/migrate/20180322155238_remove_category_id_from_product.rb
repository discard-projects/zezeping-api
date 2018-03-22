class RemoveCategoryIdFromProduct < ActiveRecord::Migration[5.1]
  def up
    remove_reference :products, :category, index: true, foreign_key: true
  end
end
