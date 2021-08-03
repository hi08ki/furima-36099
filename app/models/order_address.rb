class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :delivery_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, delivery_id: delivery_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end
