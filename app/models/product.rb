class Product < ActiveRecord::Base

  self.per_page = 2

  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories
  has_many :item_sets

  before_destroy :ensure_not_references_by_any_set_of_item
  validates :name, :description, :price, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  validates_presence_of :categories


  mount_uploader :image, ImageUploader


  def display_price(currency = nil)
    '$' + self.price.to_s if currency.nil?
  end

  private

  def ensure_not_references_by_any_set_of_item
    if item_sets.empty?
      return true
    else
      errors.add(:base, 'Set of items present')
      return false
    end
  end
end