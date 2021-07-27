class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden 
  belongs_to :category
  belongs_to :daysdelivery
  belongs_to :delivery
  belongs_to :status

  validates :title, :text, presence: true

  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}  
end
