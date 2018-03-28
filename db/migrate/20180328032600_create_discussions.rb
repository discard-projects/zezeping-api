class CreateDiscussions < ActiveRecord::Migration[5.1]
  def change
    create_table :discussions do |t|
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true
      t.string :desc

      t.timestamps
    end
  end
end
