class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :preparation_day 
  with_options presence: true do
    validates :name          
    validates :image          
    validates :introduction        
    validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"}
    validates :item_condition_id,   numericality: { other_than: 1 , message: "can't be blank"}
    validates :postage_id,          numericality: { other_than: 1 , message: "can't be blank"}
    validates :region_id,           numericality: { other_than: 1 , message: "can't be blank"}
    validates :preparation_day_id,  numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  
end
