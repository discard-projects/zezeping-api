class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :kind, limit: 1, default: 0

      t.timestamps
    end
  end
end
