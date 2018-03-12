class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :store, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.decimal :price, precision: 10, scale: 2, default: 0.0
      t.string :dest
      t.decimal :rank, precision: 2, scale: 1, default: 0

      t.timestamps
    end
  end
end
