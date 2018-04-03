class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, default: 0
      # 总价格
      t.decimal :price, precision: 10, scale: 2, default: 0
      #  调整价格 -1
      t.decimal :adjustment_price, precision: 10, scale: 2, default: 0
      # 额外费用 +1
      t.decimal :additional_tax_aprice, precision: 10, scale: 2, default: 0
      # 优惠金额 -1
      t.decimal :promo_price, precision: 10, scale: 2, default: 0
      # 真实需要支付金额
      t.decimal :payment_price, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
