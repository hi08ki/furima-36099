class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i , message: "Please input letters and numbers"}
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
       
  has_many :orders
  has_many :items
  has_many :comments, dependent: :destroy
end
