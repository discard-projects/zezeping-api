class CreateShopDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_details do |t|
      t.references :shop, foreign_key: true
      t.string :phones
      t.string  :rank_detail

      t.timestamps
    end
  end
end
