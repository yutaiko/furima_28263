class CreateItemPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :item_purchases do |t|
      t.references :user, null:false, foreign_keys: true
      t.references :item, null:false, foreign_keys: true
      t.timestamps
    end
  end
end
