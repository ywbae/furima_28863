class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references   :user,                  foreign_key: true
      t.string       :name,                  null: false
      t.text         :text,                  null: false
      t.integer      :price,                 null: false
      t.integer      :trading_status,        null: false
      t.integer      :category_id,           null: false
      t.integer      :sales_status_id,       null: false
      t.integer      :shipping_fee_id,       null: false
      t.integer      :prefecture_id,         null: false
      t.integer      :scheduled_delivery_id, null: false
      t.timestamps
    end
  end
end
