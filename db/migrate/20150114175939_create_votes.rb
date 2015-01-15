class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
      t.integer :score
      t.timestamps null: false
    end
  end
end
