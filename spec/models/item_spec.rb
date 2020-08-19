require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.photo = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品機能' do
    context '出品成功' do
      it 'フォームの内容が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '出品失敗' do
      it '画像が空では登録できない' do
        @item.photo = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Photoファイルを添付してください")
      end
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください")
      end
      it 'shipping_charge_idが空では登録できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください")
      end
      it 'shipping_origin_idが空では登録できない' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください")
      end
      it 'days_until_shipping_idが空では登録できない' do
        @item.days_until_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は数値で入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceの値が¥300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceの値が¥10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
    end
  end
end
