class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string :name
      t.string :image
      t.string :desc
      t.string :link
      t.boolean :enabled

      t.timestamps
    end
  end
end
