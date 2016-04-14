class LineItemsController < ApplicationController

  def create
    current_user.current_cart = current_user.carts.build() unless current_cart.present?
    current_user.current_cart.add_item(params[:item_id]).save
    current_user.current_cart.save
    redirect_to cart_path(current_cart)
  end

end
