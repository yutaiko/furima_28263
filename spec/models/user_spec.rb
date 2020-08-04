require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do    
    context '新規登録成功' do
      it "nickname, email, first_name, last_name, first_name_kana, last_name_kana, birthdayが存在していれば登録ができる" do
        expect(@user).to be_valid
      end
      it "パスワードが6文字以上で登録ができる" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "last_nameが空では登録できない" do
      end
      it "first_name_kanaが空では登録できない" do
      end
      it "last_name_kanaが空では登録できない" do
      end
      it "birthdayが空では登録できない" do
      end
      it "パスワードが5文字以下では登録できない" do
      end
      it "パスワードが半角だけでは登録できない" do
      end
      it "パスワードが数字だけでは登録できない" do
      end
      it "確認用のパスワードを含めて２回入力しないと登録できない" do
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）以外では登録できない" do
      end
      it "ユーザー本名フリガナは全角カタカナ以外では登録できない" do
      end
    end
  end
end