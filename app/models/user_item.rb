class UserItem
  include ActiveModel::Model
  attr_accessor :nickname, :email, :encripted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :image, :name, :introduction, :category_id, :item_condition_id, :postage_id, :region_id, :preparation_day_id, :price, :post_code, :region_id, :city, :block, :building_name, :phone_number

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
    validates :last_name,                       format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :first_name,                      format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :last_name_kana,                  format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana,                 format: {with: /\A[ァ-ヶー－]+\z/}
    validates :password,                        format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/}
    validates :nickname       
    validates :birthday      
    validates :user_id
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX


end

