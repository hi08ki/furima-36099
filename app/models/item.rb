class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden 
  belongs_to :category
  belongs_to :days_delivery
  belongs_to :delivery
  belongs_to :status

  # enum status_id: ["新品・未使用","未使用に近い","目立った傷や汚れなし","やや傷や汚れあり","傷や汚れあり","全体的に状態が悪い"]
  # enum burden_id: ["着払い(購入者負担)","送料込み(出品者負担)"]
  # enum days_delivery_id:  ["1~2日で発送","2~3日で発送","4~7日で発送"]
  

  VALID_PRICEL_REGEX =  /\A[0-9]+\z/
  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :delivery_id
    validates :days_delivery_id
    validates :price, format: {with: VALID_PRICEL_REGEX},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }

  end
end