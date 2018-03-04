class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :stores, foreign_key: true
      t.string :content
      t.decimal :rank, precision: 2, scale: 1
      t.decimal :rank_taste, precision: 2, scale: 1
      t.decimal :rank_env, precision: 2, scale: 1
      t.decimal :rank_service, precision: 2, scale: 1
      t.integer :per_expense

      t.timestamps
    end
  end
end
