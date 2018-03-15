class AddOpenTimeDescToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :open_time_desc, :string
  end
end
