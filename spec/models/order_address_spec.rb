require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'delivery_idが未選択だと購入できない' do
        @order_address.delivery_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'municipalityが空だと購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁かつハイフンありでは購入できない' do
        @order_address.phone_number = "090-123-456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number number is invalid. Include half-width numbers") 
      end
    end
  end
end
