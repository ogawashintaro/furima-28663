class ItemsController < ApplicationController
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item      = Item.new
    @category  = CategoryId.all
    @area      = AreaId.all
    @date      = ShippingDateId.all
    @delivery  = DelivetyFeeId.all
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :information, :category_id, :delivery_fee_id, :area_id, :shipping_date_id, :product_condition_id, :user_id, :image)
  end
end
