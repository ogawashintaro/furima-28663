class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item,           only: [:show, :edit, :update]
  before_action :move_to_index,      only: :edit

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id != item.user_id
      redirect_to root_path
    else
      if item.destroy
        redirect_to root_path
      end
    end
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :price, :information, :category_id, :delivery_fee_id, :area_id, :shipping_date_id, :product_condition_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end
