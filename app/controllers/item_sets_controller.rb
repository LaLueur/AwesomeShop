class ItemSetsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    @item_set = @order.item_sets.build(product: product)

    respond_to do |format|
      if @item_set.save
        format.html {redirect_to @item_set.order}
        format.json {render action:'show', status: :created, location: @item_set}
      else
        format.html { render action: 'new'}
        format.json {render json: @item_sets.errors, status: :unprocessable_entity}
      end
    end
  end


private
  def item_sets_params
    params.require(:item_set).permit(:product_id)
  end
end