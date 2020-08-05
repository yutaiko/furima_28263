class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  validates :genre_id, numericality: { other_than: 1 }   #ジャンルの選択が「--」の時は保存できないようにする

  belongs_to :user
  has_one_attached :image

end
