class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_sending_destination = PurchaseSendingDestination.new
    
  end
  
  def create
   @item = Item.find(params[:item_id])
   @purchase_sending_destination = PurchaseSendingDestination.new(purchase_params)

   if @purchase_sending_destination.valid?
      @purchase_sending_destination.save
      return redirect_to root_path
   else
      render :index
   end
  end
  
  
  private
  def purchase_params
    params.require(:purchase_sending_destination).permit(:post_code, :region_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
