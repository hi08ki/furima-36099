class Residence
  include ActiveModel::Model
  attr_accessor :purchase,:postal_code,:delively_id,:municipality,:address,:building_name,:phone_number

belongs_to :purchase
 
with_options presence: true do
  validates :purchase
  validates :postal_code
  validates :delively_id
  validates :municipality
  validates :address
  validates :building_name
  validates :phone_number


  def save
    # 各テーブルにデータを保存する処理を書く
  end