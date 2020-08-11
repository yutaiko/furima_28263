class ItemPurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_item_id, only: [:index]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :same_user_do_not_purchase, only: [:index, :create]

  def index
  end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).premit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
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
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
