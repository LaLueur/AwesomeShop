class CreateItemSets < ActiveRecord::Migration
  def change
    create_table :item_sets do |t|
      t.references :product, index: true
      t.belongs_to :order, index: true
      t.integer :quantity, default: 1
      t.decimal :price, precision: 8, scale: 2, default: 0.0

      t.timestamps null: false
    end
    add_foreign_key :item_sets, :products
    add_foreign_key :item_sets, :orders
  end
end
