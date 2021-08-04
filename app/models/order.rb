class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :residence
  
 attr_accessor :token
   validates :price, presence: true
   validates :token, presence: true


  with_options presence: true do
    validates :product_name
    validates :price
    validates :burden_id
    validates :image
  end
end


