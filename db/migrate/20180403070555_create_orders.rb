class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :oid
      t.integer :products_count, default: 0
      # 总金额 100
      t.decimal :amount, precision: 10, scale: 2, default: 0
      # 调整金额 -1
      t.decimal :adjustment_amount, precision: 10, scale: 2, default: 0
      # 运费 1
      t.decimal :shipment_amount, precision: 10, scale: 2, default: 0
      # 额外费用 3
      t.decimal :additional_tax_amount, precision: 10, scale: 2, default: 0
      # 优惠额度 -4
      t.decimal :promo_amount, precision: 10, scale: 2, default: 0
      # 真实支付金额
      t.decimal :payment_amount, precision: 10, scale: 2, default: 0
      t.string :status
      t.references :user, foreign_key: true
      t.string :special_instruction

      t.timestamps
    end
  end
end
