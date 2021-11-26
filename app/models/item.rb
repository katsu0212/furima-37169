class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name          
    validates :introduction        
    validates :category_id    
    validates :item_condition_id   
    validates :postage_id          
    validates :region_id    
    validates :preparation_day_id
    validates :price,               format: {with: /\A[0-9]+\z/} 
  end
end
