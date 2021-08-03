require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it "priceとtokenがあれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Price can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  # describe '#create' do
  #   it "user_id, customer_id, card_idが存在すれば登録できること" do
  #     card = build(:card)
  #     expect(card).to be_valid
  #   end
  #   it "user_idが無い場合は登録できないこと" do
  #     card = build(:card, user_id: nil)
  #     card.valid?
  #     expect(card.errors[:user_id]).to include("User id can't be blank")
  #   end
  #   it "customer_idが無い場合は登録できないこと" do
  #     card = build(:card, customer_id: nil)
  #     card.valid?
  #     expect(card.errors[:customer_id]).to include("Image can't be blank")
  #   end
  #   it "card_idが無い場合は登録できないこと" do
  #     card = build(:card, card_id: nil)
  #     card.valid?
  #     expect(card.errors[:card_id]).to include("Image can't be blank")
  #   end
  # end
  end
end
