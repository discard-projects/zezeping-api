class CreateMoments < ActiveRecord::Migration[5.1]
  def change
    create_table :moments do |t|
      t.references :store, foreign_key: true
      t.string :content
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
