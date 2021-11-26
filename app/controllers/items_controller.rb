class ItemsController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    @item = Item.find(item_params)
    @item.save
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :item_condition_id, :postage_id, :region_id, :preparation_day_id, :price)
  end
end
