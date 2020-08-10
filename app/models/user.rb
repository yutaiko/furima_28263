class User < ApplicationRecord
  has_many :items
  has_many :item_purchase

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  Regex1 = /\A\S+@\S+\.\S+\z/.freeze # @が入る
  Regex2 = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze # 半角英数字各１文字以上大文字小文字区別なし
  Regex3 = /\A[ぁ-んァ-ン一-龥]+\z/.freeze # 全角ひらがなカタカナ漢字
  Regex4 = /\A[ァ-ン]+\z/.freeze # 全角カタカナ制限

  with_options presence: true do
    validates :nickname
    validates :email,           uniqueness: true, format: { with: Regex1 }
    validates :password,        format: { with: Regex2 }
    validates :last_name,       format: { with: Regex3 }
    validates :first_name,      format: { with: Regex3 }
    validates :last_name_kana,  format: { with: Regex4 }
    validates :first_name_kana, format: { with: Regex4 }
    validates :birthday
  end
end
