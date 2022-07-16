class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
    @categorys = Category.all
    @productconditions  = ProductCondition.all
    @deliveryfees = DeliveryFee.all
    @areas = Area.all
    @shippingdates = ShippingDate.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :information, :category_id, :delivery_fee_id, :area_id, :shipping_date_id, :product_condition_id, :image).merge(user_id: current_user.id)
  end
end
