class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :last_name,       format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name,      format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :password,:password_confirmation, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
    validates :nickname       
    validates :birthday        
  end
    
end