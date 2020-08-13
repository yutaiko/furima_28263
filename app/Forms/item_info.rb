class ItemInfo

  include ActiveModel::Model
  attr_accessor :price,
                :token,
                :postcode,
                :prefecture_id,
                :city,
                :block,
                :building,
                :phone_number,
                :stock,
                :item_id,
                :user_id

  with_options presence: true do
    validates :token  #クレジットカードのトークン情報
    validates :postcode,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number,  format: { with: /\A\d{11}\z/ }
  end

  def save
    @item = Item.find(item_id)
    @item.update(stock: 0) #在庫を0にする
    ShippingMethod.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, item_id: item_id)
    ItemPurchase.create(user_id: user_id, item_id: item_id)
  end

end