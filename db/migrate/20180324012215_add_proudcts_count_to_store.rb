class AddProudctsCountToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :products_count, :integer, default: 0
  end
end
