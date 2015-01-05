class Category < ActiveRecord::Base

  acts_as_list

  has_many :product_categories
  has_many :products, through: :product_categories

  scope :sorted, -> { order(:position) }

  before_create :set_position

  def set_position
    self.position = Category.maximum(:position) + 1
  end

end