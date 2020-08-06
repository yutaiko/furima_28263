require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '' do
    context '' do
      it '存在していれば登録ができる' do
        binding.pry
        # expect(@user).to be_valid
      end
      it 'パスワードが6文字以上で登録ができる' do
        # @user.password = 'test5656'
        # @user.password_confirmation = 'test5656'
        # expect(@user).to be_valid
      end
    end
  end
end