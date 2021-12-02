class PurchaseSendingDestination
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :block, :building_name, :phone_number,:user_id,:item_id,:token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code,           format: {with: /\A\d{3}-\d{4}\z/, message:"Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :block
    validates :phone_number,        format: {with: /\A\d{10}$|^\d{11}\z/, message: "is too short"}       

  end
   validates :phone_number,        numericality: { only_integer: true, message: "is invalid. Input only number"}        
   validates :region_id,           numericality: { other_than: 1 , message: "can't be blank"}
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    SendingDestination.create(post_code: post_code, region_id: region_id, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end