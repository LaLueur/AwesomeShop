class OrdersController < ApplicationController

  before_action :check_auth, only: [:create]

  def create
    products = []
    if cookies[:cart].present?
      product_ids = cookies[:cart].split(',')
      uniq_product_ids = product_ids.uniq
      uniq_product_ids.each do |product_id|
        product = Product.find(product_id)
        quantity = product_ids.count(product_id)
        products << [product, quantity]
      end
    end

    order = Order.new
    order.user = current_user
    order.total_cost = @cart_total
    order.save!
    products.each do |product, quantity|
      item_set = ItemSet.new
      item_set.order = order
      item_set.product = product
      item_set.quantity = quantity
      item_set.price = product.price
      item_set.save
    end

    OrderMailer.delay.order_confirmation(order)

    cookies[:cart] = nil

    flash[:notice] = "Success. You will receive confirmation mail soon."

    redirect_to root_path

  end


  private

  def check_auth
    unless current_user
      flash[:notice] = "Sorry, please login first."
      redirect_to new_user_session_path
    end
  end


end