class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.string :content
      t.decimal :rank, precision: 2, scale: 1
      t.string  :rank_detail
      t.integer :per_expense, default: 0

      t.string :attachments

      t.timestamps
    end
  end
end
