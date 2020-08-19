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
        expect(@seller.errors.full_messages).to include("Tokenを入力してください")
      end
    end
    context '購入登録失敗' do
      it '配送先の情報として郵便番号がないと決済できない' do
        @buyer.postcode = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '配送先の情報として都道府県がないと決済できない' do
        @buyer.prefecture_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("都道府県は数値で入力してください")
      end
      it '配送先の情報として市区町村がないと決済できない' do
        @buyer.city = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("市区町村を入力してください")
      end
      it '配送先の情報として番地がないと決済できない' do
        @buyer.block = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("番地を入力してください")
      end
      it '配送先の情報として電話番号がないと決済できない' do
        @buyer.phone_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("電話番号を入力してください")
      end
      it '郵便番号にはハイフンが必要であること' do
        @buyer.postcode = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '電話番号にはハイフンが不要であること' do
        @buyer.phone_number = '090-1234-5678'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
