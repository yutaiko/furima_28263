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
        @user.password = "test5656"
        @user.password_confirmation = "test5656"
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
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "パスワードが5文字以下では登録できない" do
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが半角英字だけでは登録できない" do
        @user.password = "testtest"
        @user.password_confirmation = "testtest"
        @user.valid?
      end
      it "パスワードが半角数字だけでは登録できない" do
      end
      it "確認用のパスワードを含めて２回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名last_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.last_name = "Tom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "ユーザー本名first_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name = "Alex"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー本名first_name_kanaフリガナは全角カタカナ以外では登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "ユーザー本名last_name_kanaフリガナは全角カタカナ以外では登録できない" do
        @user.last_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end


