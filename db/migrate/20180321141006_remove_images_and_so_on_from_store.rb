class RemoveImagesAndSoOnFromStore < ActiveRecord::Migration[5.1]
  def change
    remove_column :stores, :images
    remove_column :stores, :opening_at
    remove_column :stores, :closing_at
  end
end
