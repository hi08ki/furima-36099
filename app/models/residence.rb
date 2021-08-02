class Residence < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :delivery_id
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number
  end
end

