require 'rails_helper'

RSpec.describe ItemInfo, type: :model do
  describe '' do
    before do
      @item_info = FactoryBot.build(:item_info)
    end

    context '購入登録成功' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end
    context '購入登録失敗' do
      it 'クレジットカード情報は必須で、正しいクレジットカードの情報でない時は決済できないこと' do
      end
      it '配送先の情報として郵便番号がないと決済できない' do
      end
      it '配送先の情報として都道府県がないと決済できない' do
      end
      it '配送先の情報として市区町村がないと決済できない' do
      end
      it '配送先の情報として番地がないと決済できない' do
      end
      it '配送先の情報として電話番号がないと決済できない' do
      end
      it '郵便番号にはハイフンが必要であること' do
      end
      it '電話番号にはハイフンが不要であること' do
      end
    end
  end
end
