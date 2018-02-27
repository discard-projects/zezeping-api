class AddAncestryToRegion < ActiveRecord::Migration[5.1]
  def change
    add_column :regions, :ancestry, :string
    add_index :regions, :ancestry
  end
end
