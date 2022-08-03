class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase.valid?
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
end
