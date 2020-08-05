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

end



# :condition, :shipping_charge, :shipping_origin, :days_until_shipping

# :condition_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id,