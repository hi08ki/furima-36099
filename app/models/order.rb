class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :residence
  attr_accessor :token
  
  
end


