require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
    before do
      @order = FactoryBot.build(:order_delivery)
    end

    describe '#create' do
    context '購入ができるとき'do
      it '全ての記載があれば購入できる' do
        expect(@order).to be_valid
      end

      it 'build_nameが空白でも登録できる' do
        @order.build_name = nil
        expect(@order).to be_valid
      end
    end

    context'購入ができないとき' do
    it 'postal_codeが空白だと購入できない' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'prefecture_genre_idが空白では購入できない' do
      @order.prefecture_genre_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture genre can't be blank", 'Prefecture genre is not a number')
    end

    it 'prefecture_genre_idが1以外でないと購入できないこと' do
      @order.prefecture_genre_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture genre must be other than 1")
    end

    it 'municipalityが空白だと購入できない' do
      @order.municipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空白だと購入できない' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空白だと購入できない' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'tokenが空白だと購入できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeはハイフンがないと購入できない' do
      @order.postal_code = 1234567
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end

    it 'phone_numberが11桁以内だと購入できない' do
      @order.phone_number = 123456789123
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
  end
  end
end
