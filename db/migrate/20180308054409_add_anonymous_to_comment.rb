class AddAnonymousToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :anonymous, :boolean, default: false
  end
end
