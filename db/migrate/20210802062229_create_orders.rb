class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user,          null: false, foreign_key: true
      t.references :item,          null: false, foreign_key: true
      t.string     :image,         null: false
      t.string     :product_name,  null: false
      t.integer    :price,         null: false
      t.integer    :burden_id,     null: false
      t.timestamps
    end
  end
end
