class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

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

end