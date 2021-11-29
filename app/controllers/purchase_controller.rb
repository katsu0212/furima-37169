class deletesController < ApplicationController
  def index

  end

  def new 
    @purchase_sending_destinations = UserItems.new
  end

  def create
    @purchase_sending_destinations = UserItems.new(purchase_params)
    if @purchase_sending_destinations.valid?
      @purchase_sending_destinations.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def purchase_params
    params.require(:purchase_sending_destinations).permit(:post_code, :region_id, :city, :block, :building_name, :phone_number, :price).merge(user_id: current_user.id)
  end
end