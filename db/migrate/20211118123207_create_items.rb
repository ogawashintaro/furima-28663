class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,            null: false
      t.integer    :price,                null: false
      t.text       :information,          null: false
      t.integer    :category_id,          null: false
      t.integer    :delivery_fee_id,      null: false
      t.integer    :area_id,              null: false
      t.integer    :shipping_date_id,     null: false
      t.integer    :product_condition_id, null: false
      t.references :user,                 null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
