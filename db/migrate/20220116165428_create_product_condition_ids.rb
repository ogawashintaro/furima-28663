class CreateProductConditionIds < ActiveRecord::Migration[6.0]
  def change
    create_table :product_condition_ids do |t|

      t.timestamps
    end
  end
end
