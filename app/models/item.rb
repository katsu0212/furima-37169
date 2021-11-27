class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage
  belongs_to :region
  belongs_to :preparation_day 
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name          
    validates :introduction        
    validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"}
    validates :item_condition_id   
    validates :postage_id          
    validates :region_id    
    validates :preparation_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9_999_999 },    format: { with: /\A[0-9]+\z/ } 
  end
end
