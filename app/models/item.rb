class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :preparation_day 
  

  
end
