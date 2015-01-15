class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_cost, precision: 8, scale: 2, default: 0.0
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
