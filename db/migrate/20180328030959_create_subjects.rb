class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :content
      t.boolean :enabled, default: false
      t.references :user, foreign_key: true
      t.integer :discussions_count, default: 0
      t.integer :votes_count, default: 0
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
