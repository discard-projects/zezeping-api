class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|

      t.string :name
      t.string :desc
      t.integer :status, default: 0
      t.integer :comments_count, default: 0
      t.references :category, foreign_key: true
      t.references :region, foreign_key: true
      t.string :address
      t.string :logo
      t.string :images
      t.decimal :rank, precision: 2, scale: 1
      t.integer :per_expense, default: 0
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.time :opening_at
      t.time :closing_at

      t.timestamps
    end
  end
end
