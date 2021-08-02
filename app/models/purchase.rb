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
    # ユーザーの情報を保存し、「user」という変数に代入
    user = User.create(nickname: nickname, last_name: last_name, farst_name: farst_name, last_name_kana: last_name_kana, farst_name_kana: farst_name_kana)
  end
end