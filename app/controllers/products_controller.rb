class ProductsController < ApplicationController

  def index
    @products = Product.paginate(:page => params[:page])
  end

  def show

  end

  def show_cart
    @products = []
    if cookies[:cart].present?
      product_ids = cookies[:cart].split(',')
      uniq_product_ids = product_ids.uniq
      uniq_product_ids.each do |product_id|
        product = Product.find(product_id)
        quantity = product_ids.count(product_id)
        @products << [product, quantity]
      end
    end

  end

  def add_to_cart

    product_id = params[:id]

    if cookies[:cart].present?
      products = cookies[:cart].split(',')
      products << product_id
      cookies[:cart] = products.join(',')
    else
      cookies[:cart] = product_id
    end

    redirect_to :back

  end

  def clear_cart

    cookies[:cart] = nil

    redirect_to root_path

  end

  def remove_from_cart

  end

end