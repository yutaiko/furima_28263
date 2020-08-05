class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
    @category =[{id:1,name: "test"},{id:2, name: "test2"}]
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).premit(
      :image,
      :name,
      :description,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :shipping_origin_id,
      :days_until_shipping_id,
      :price,
      :user
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end