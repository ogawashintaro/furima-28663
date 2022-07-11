class ItemsController < ApplicationController
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item      = Item.new
  end

  def create
    @product = Item.new(item_params)

    if @product.save
      redirect_to root_path(@product)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :information, :category_id, :delivery_fee_id, :area_id, :shipping_date_id, :product_condition_id).merge(user_id: current_user.id)
  end
end
