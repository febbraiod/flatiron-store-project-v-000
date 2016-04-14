class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @item = Item.find_by(id: params[:id])
  end

end
