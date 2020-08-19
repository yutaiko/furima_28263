class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :category_id, numericality: { other_than: 0 }

  belongs_to_active_hash :condition
  validates :condition_id,  numericality: { other_than: 0 }

  belongs_to_active_hash :shippingCharge
  validates :shipping_charge_id, numericality: { other_than: 0 }

  belongs_to_active_hash :shippingOrigin
  validates :shipping_origin_id, numericality: { other_than: 0 }

  belongs_to_active_hash :daysUntilShipping
  validates :days_until_shipping_id, numericality: { other_than: 0 }

  with_options presence: true do
    validates :name
    validates :description
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :item_purchase
  has_one :shipping_method
  has_one_attached :photo
  validate :photo_presence

  private

  def photo_presence
    if photo.attached?
      if !photo.content_type.in?(%('image/jpeg image/png'))
        errors.add(:photo, 'ファイルの形式は、JPEGもしくはPNGを添付してください')
      end
    else
      errors.add(:photo, 'ファイルを添付してください')
    end
  end
end
