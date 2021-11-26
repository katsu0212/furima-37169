class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name,                presence: true 
  validates :introduction,        presence: true
  validates :category_id,         presence: true
  validates :item_condition_id,   presence: true
  validates :postage_id,          presence: true
  validates :region_id,           presence: true 
  validates :preparation_day_id,  presence: true
  validates :price,               presence: true
end
