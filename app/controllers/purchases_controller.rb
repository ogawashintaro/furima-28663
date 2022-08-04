class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :purchase_item, only: [:index, :create]

  def index
    @purchase = Purchase.new
    if @item.buyer.present?
      if current_user.id == @item.user_id
        redirect_to root_path
      end
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    else
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    end
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :tel).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def purchase_item
    @item = Item.find(params[:item_id])
  end
end
