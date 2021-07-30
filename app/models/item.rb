class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :burden 
  belongs_to :category
  belongs_to :days_delivery
  belongs_to :delivery
  belongs_to :status
  has_one_attached :image
  
  VALID_PRICEL_REGEX =  /\A[0-9]+\z/
  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :price, format: {with: VALID_PRICEL_REGEX},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  end
  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :delivery_id
    validates :days_delivery_id  
  end

  def was_attached?
    self.image.attached?
  end
end