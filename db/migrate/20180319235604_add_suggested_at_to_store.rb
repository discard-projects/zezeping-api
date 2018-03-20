class AddSuggestedAtToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :suggested_at, :datetime
  end
end
