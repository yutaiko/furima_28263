require 'rails_helper'

RSpec.describe ItemInfo, type: :model do
  describe '商品購入機能' do
    before do
      @buyer = FactoryBot.build(:item_info)
      @seller = FactoryBot.build(:item_info)
      @seller.user_id = 2
    end

    context '購入登録成功' do
      it 'すべての値が正しく入力されていれば保存できること' do
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Token can't be blank")
      end
    end
    context '購入登録失敗' do
      it '配送先の情報として郵便番号がないと決済できない' do
        @buyer.postcode = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postcode can't be blank")
      end
      it '配送先の情報として都道府県がないと決済できない' do
        @buyer.prefecture_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送先の情報として市区町村がないと決済できない' do
        @buyer.city = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として番地がないと決済できない' do
        @buyer.block = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Block can't be blank")
      end
      it '配送先の情報として電話番号がないと決済できない' do
        @buyer.phone_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にはハイフンが必要であること' do
        @buyer.postcode = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Postcode is invalid')
      end
      it '電話番号にはハイフンが不要であること' do
        @buyer.phone_number = '090-1234-5678'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
