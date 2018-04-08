class AddCollectionsCountToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :collections_count, :integer, default: 0
  end
end
