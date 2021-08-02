class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :residence

  with_options presence: true do
    validates :product_name
    validates :price
    validates :burden_id
    validates :image
  end
end
