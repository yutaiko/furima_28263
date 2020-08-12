class ItemInfo

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number

  #ShippingMethodのバリデーション
  with_options presence: true do
    validates :postcode,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number,  format: { with: /\A\d{11}\z/ }
  end

  def save
    ShippingMethod.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end

end