class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :tel, :item_id).merge(user_id: current_user.id)
  end
end
