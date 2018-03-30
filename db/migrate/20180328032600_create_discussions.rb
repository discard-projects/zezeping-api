class CreateDiscussions < ActiveRecord::Migration[5.1]
  def change
    create_table :discussions do |t|
      t.references :user, foreign_key: true
      t.references :discussable, polymorphic: true
      t.string :content
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
