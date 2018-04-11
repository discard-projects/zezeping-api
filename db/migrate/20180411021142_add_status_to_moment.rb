class AddStatusToMoment < ActiveRecord::Migration[5.1]
  def change
    add_column :moments, :status, :integer, limit: 1, default: 0
  end
end
