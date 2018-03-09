class CreateCategoriesStores < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_stores do |t|
      t.belongs_to :category, index: true
      t.belongs_to :store, index: true
    end
  end
end
