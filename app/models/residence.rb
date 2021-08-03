class Residence < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :delivery_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 
  end
end

