class ProductController < ApplicationController

  def index
    @products = Product.all
  end

  def show

  end

  def add_to_cart

  end

  def remove_from_cart

  end

end