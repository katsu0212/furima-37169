require 'rails_helper'

RSpec.describe PurchaseSendingDestination, type: :model do
  before do 
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_sending_destination = FactoryBot.build(:purchase_sending_destination, user_id: @user, item_id: @item)
    sleep 0.1
end

describe '商品の購入'  do
  context '商品の購入ができる場合'  do
    it "post_code,region,city,block,phone_numberが正しく入力されている," do
      expect(@purchase_sending_destination).to be_valid
    end

    it "building_nameが空でも購入できる" do
      @purchase_sending_destination.building_name=nil
      expect(@purchase_sending_destination).to be_valid
    end
  end

  context '商品の購入ができない場合'
    it "post_codeが空だと購入できない" do
      @purchase_sending_destination.post_code=nil
      @purchase_sending_destination.valid?
      expect(@purchase_sending_destination.errors.full_messages).to include("Post code can't be blank", "Post code Enter it as follows (e.g. 123-4567)")
    end

    it "post_codeは「3桁ハイフン4桁」の半角文字列でないと購入できない" do
      @purchase_sending_destination.post_code="12-123"
      @purchase_sending_destination.valid?
      expect(@purchase_sending_destination.errors.full_messages).to include("Post code Enter it as follows (e.g. 123-4567)")
    end

    it "region_idが空だと購入できない" do
      @purchase_sending_destination.region_id=nil
      @purchase_sending_destination.valid?
      expect(@purchase_sending_destination.errors.full_messages).to include("Region can't be blank")

    end

    it "cityが空では購入できない" do
      @purchase_sending_destination.city=nil
      @purchase_sending_destination.valid?
      expect(@purchase_sending_destination.errors.full_messages).to include("City can't be blank")
    end

    it "blockが空では購入できない" do
      @purchase_sending_destination.block=nil
      @purchase_sending_destination.valid?
      expect(@purchase_sending_destination.errors.full_messages).to include("Block can't be blank")
    end

    it "phone_numberが空だと購入できない" do
      @purchase_sending_destination.phone_number=nil
      @purchase_sending_destination.valid?
      expect(@purchase_sending_destination.errors.full_messages).to include("Phone number can't be blank","Phone number is too short","Phone number is invalid. Input only number")
    end

    it "phone_numberは10桁以上11桁以内の半角数値でないと購入できない" do
    end
  end
  end

