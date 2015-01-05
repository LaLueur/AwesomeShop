class Product < ActiveRecord::Base

  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories

  validates :name, :description, :price, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  validates_presence_of :categories


  mount_uploader :image, ImageUploader

end