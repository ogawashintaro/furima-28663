class CreateShippingDateIds < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_date_ids do |t|

      t.timestamps
    end
  end
end
