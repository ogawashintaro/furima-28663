class CreateDeliveryFeeIds < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_fee_ids do |t|

      t.timestamps
    end
  end
end
