class Residence
  include ActiveModel::Model
  attr_accessor :purchase,:postal_code,:delively_id,:municipality,:address,:building_name,:phone_number

belongs_to :purchase
 
with_options presence: true do
  validates :purchase
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } 
  validates :delively_id
  validates :municipality
  validates :address
  validates :building_name
  validates :phone_number


  def save
    # 住所の情報を保存
    Address.create(postal_code: postal_code, delivery＿id: delivery_id, municipality: municipality, address: address, building_name: building_name, building_name: building_name, user_id: user.id)
    # 投資金の情報を保存
    Investment.create(price: price, user_id: user.id)
  end
end