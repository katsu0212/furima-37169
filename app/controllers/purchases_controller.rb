class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_set,  only:[:index]
  before_action :item_self,  only:[:index]



  def index
    @item = Item.find(params[:item_id])
    @purchase_sending_destination = PurchaseSendingDestination.new
    
  end
  
  def create
  
   @item = Item.find(params[:item_id])
   @purchase_sending_destination = PurchaseSendingDestination.new(purchase_params)
   if @purchase_sending_destination.valid?
      pay_item
      @purchase_sending_destination.save
      return redirect_to root_path
   else
      render :index
   end
  end
  
  
  private
  def purchase_params
    params.require(:purchase_sending_destination).permit(:post_code, :region_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
    
  end

  def item_set
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def item_self
    unless current_user.id != @item.user_id
      redirect_to root_path
    end
  end

end
