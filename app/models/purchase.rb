class Purchase
  include ActiveModel::Model
  attr_accessor :user,:item

  belongs_to :user
  belongs_to :item
  has_one :residence
  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :user
    validates :item
    
  def save
    # 各テーブルにデータを保存する処理を書く
  end
end