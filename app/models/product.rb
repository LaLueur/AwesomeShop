class Product < ActiveRecord::Base

  self.per_page = 2

  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories

  validates :name, :description, :price, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  validates_presence_of :categories


  mount_uploader :image, ImageUploader


  def display_price(currency = nil)
    '$' + self.price.to_s if currency.nil?
  end

end