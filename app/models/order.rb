class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :residence

  with_options presence: true do
    validates :user_id
    validates :item
  end
end
