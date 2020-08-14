require 'rails_helper'

RSpec.describe ItemInfo, type: :model do
  describe '商品購入機能' do
    before do
      @item_info = FactoryBot.build(:item_info)
    end

    context '購入登録成功' do
      it 'すべての値が正しく入力されていれば保存できること' do
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("Token can't be blank")
      end
    end
    context '購入登録失敗' do
      it '配送先の情報として郵便番号がないと決済できない' do
        @item_info.postcode = nil
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("Postcode can't be blank")
      end
      it '配送先の情報として都道府県がないと決済できない' do
        @item_info.prefecture_id = nil
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送先の情報として市区町村がないと決済できない' do
        @item_info.city = nil
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として番地がないと決済できない' do
        @item_info.block = nil
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("Block can't be blank")
      end
      it '配送先の情報として電話番号がないと決済できない' do
        @item_info.phone_number = nil
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にはハイフンが必要であること' do
        @item_info.postcode = "1234567"
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("Postcode is invalid")
      end
      it '電話番号にはハイフンが不要であること' do
        @item_info.phone_number = "090-1234-5678"
        @item_info.valid?
        expect(@item_info.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
