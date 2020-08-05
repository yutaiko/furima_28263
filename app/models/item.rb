class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :category_id,  numericality: { other_than: 0 } 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  validates :condition_id,  numericality: { other_than: 0 } 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingCharge
  validates :shipping_charge_id,  numericality: { other_than: 0 } 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingOrigin
  validates :shipping_origin_id,  numericality: { other_than: 0 } 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :daysUntilShipping
  validates :days_until_shipping_id,  numericality: { other_than: 0 } 
  


  belongs_to :user
  has_one_attached :photo
  validate :photo_type

  private
  def photo_type
    if !photo.content_type.in?(%('image/jpec image/png'))
      errors.add(:image, 'needs to be a JPEG or PNG')
    end
  end
end