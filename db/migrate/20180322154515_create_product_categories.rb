class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.references :store, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
