class CreateAttachmentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :attachment_images do |t|
      t.string :file
      t.references :owner, polymorphic: true

      t.timestamps
    end
  end
end
