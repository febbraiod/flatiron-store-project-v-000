class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @cart = Cart.find_by(id: params[:id])
    @cart.checkout
    current_user.current_cart = nil
    current_user.save
    @cart.save
    redirect_to cart_path(@cart)
  end

end
