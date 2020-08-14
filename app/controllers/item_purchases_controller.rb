class ItemPurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_item_id, only: [:index]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :same_user_do_not_purchase, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]

  def index
  end

  def create
    @item_info = ItemInfo.new(item_purchase_params)
    if @item_info.valid?
      pay_item
      @item_info.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_purchase_params
    params.permit(:price, :token, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :stock, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: @item_info.token, # カードトークン
      currency: 'jpy' # 通貨の種類
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_item_id
    @user = User.find(@item.user_id)
    @category = Category.find(@item.category_id)
    @condition = Condition.find(@item.condition_id)
    @shippingCharge = ShippingCharge.find(@item.shipping_charge_id)
    @shippingOrigin = ShippingOrigin.find(@item.shipping_origin_id)
    @daysUntilShipping = DaysUntilShipping.find(@item.days_until_shipping_id)
  end

  def same_user_do_not_purchase
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out
    # @item = Item.find(params[:item_id]) #set_itemでインスタンス生成
    if @item.stock == 0
      redirect_to root_path
    end
  end
end
