class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,               null: false
      t.integer :category_id,             null: false
      t.integer :price,                   null: false
      t.text    :description,             null: false
      t.integer :condition_id,            null: false
      t.integer :shipping_fee_bearer_id,  null: false
      t.integer :prefecture_id,           null: false
      t.integer :shipping_estimate_id,    null: false
      t.timestamps
    end
  end
end
