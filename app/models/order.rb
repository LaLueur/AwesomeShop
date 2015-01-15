class Order < ActiveRecord::Base
  has_many :item_sets, dependent: :destroy
  belongs_to :user
end