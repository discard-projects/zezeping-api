class CreateStoreDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :store_details do |t|
      t.references :store, foreign_key: true
      t.string :wechat_qrcode
      t.string :phones
      t.string :extra_contact_detail
      t.string :rank_detail

      t.timestamps
    end
  end
end
