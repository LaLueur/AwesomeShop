class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :cart_total


  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end


  def cart_total
    @cart_total = 0
    if cookies[:cart].present?
      product_ids = cookies[:cart].split(',')
      product_ids.each do |product_id|
        product = Product.find(product_id)
        @cart_total += product.price
      end
    end
    @cart_total
  end

end
