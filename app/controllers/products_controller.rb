class ProductsController < ApplicationController

  def index
    @products = Product.paginate(:page => params[:page])
  end

  def show

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

  def remove_from_cart

  end

end