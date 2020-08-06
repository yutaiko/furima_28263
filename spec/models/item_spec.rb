require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品機能' do
    context '出品成功' do
      it 'フォームの内容が正しく入力されていれば保存できる' do
        # @item.valid?
      end
      it 'パスワードが6文字以上で登録ができる' do
        # @user.password = 'test5656'
        # @user.password_confirmation = 'test5656'
        # expect(@user).to be_valid
      end
    end
    context '出品失敗' do
      it '画像が空では登録できない' do
      end
      it 'nameが空では登録できない' do
      end
      it 'descriptionが空では登録できない' do
      end
      it 'category_idが空では登録できない' do
      end
      it 'condition_idが空では登録できない' do
      end
      it 'shipping_charge_idが空では登録できない' do
      end
      it 'shipping_origin_idが空では登録できない' do
      end
      it 'days_until_shipping_idが空では登録できない' do
      end
      it 'priceが空では登録できない' do
      end
      it 'priceの値が¥300~¥9,999,999の範囲外では登録できない' do
      end
    end
    context 'アプリケーションの動作' do
      it 'ログインをしているユーザーだけが、商品ページへ遷移できる' do
      end
      it 'priceに数値を入力すると、非同期的に販売手数料や販売利益が変わる' do
      end
    end
  end
end