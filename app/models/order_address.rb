class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :delivery

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :delivery_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(order_id: order.id,postal_code: postal_code, delivery_id: delivery_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end