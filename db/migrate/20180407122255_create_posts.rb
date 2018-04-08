class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :enabled, default: false
      t.integer :discussions_count, default: 0
      t.integer :votes_count, default: 0
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
