require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての記載ができれば登録する' do
      expect(@item).to be_valid
    end

    it 'imageがないと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameがないと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'explanationがないと保存できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_genre_idが空白では保存できない' do
      @item.category_genre_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category genre can't be blank", "Category genre is not a number")
    end

    it 'category_genre_idが[---]では保存できない' do
      @item.category_genre_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include('Category genre must be other than 1')
    end

    it 'status_genre_idが[---]では保存できない' do
      @item.status_genre_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include('Status genre must be other than 1')
    end

    it 'delivery_burden_genre_idが[---]では保存できない' do
      @item.delivery_burden_genre_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery burden genre must be other than 1')
    end

    it 'prefecture_genre_idが[---]では保存できない' do
      @item.prefecture_genre_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture genre must be other than 1')
    end

    it 'delivery_days_genre_idが[---]では保存できない' do
      @item.delivery_days_genre_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery days genre must be other than 1')
    end

    it 'priceがないと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが金額が全角もしくは販売価格範囲外になる' do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Price Out of setting range')
    end

    it 'priceが300より小さいと登録できない' do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Price Out of setting range')
    end

    it 'priceが10000000より大きいと登録できない' do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Price Out of setting range')
    end
  end
end
