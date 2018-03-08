class AddEnabledToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :enabled, :boolean, default: true
  end
end
