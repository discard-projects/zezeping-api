class AddStatusToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :status, :integer, limit: 1, default: 0
  end
end
