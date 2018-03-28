class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :desc
      t.references :user, foreign_key: true
      t.integer :votes_count, default: 0
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
