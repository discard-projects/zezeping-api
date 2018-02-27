class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :desc
      t.integer :cocomments_count
      t.references :category, foreign_key: true
      t.references :region, foreign_key: true
      t.string :address
      t.string :logo
      t.decimal :rank, precision: 2, scale: 1
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
