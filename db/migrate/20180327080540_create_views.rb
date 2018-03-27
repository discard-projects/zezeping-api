class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.references :viewable, polymorphic: true
      t.integer :user_id
      t.string :ip, index: true

      t.timestamps
    end
  end
end
