class Residence
  include ActiveModel::Model
  attr_accessor :hoge,:fuga...

belongs_to :purchase
  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end