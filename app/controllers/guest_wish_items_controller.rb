# frozen_string_literal: true

class GuestWishItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @variant = Variant.find(params[:variant_id])
    current_wish.wish(@product, @variant)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def destroy
    @current_item = GuestWishItem.find(params[:id])
    @product = @current_item.product
    @variant = @current_item.variant
    current_wish.unwish(@current_item)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end
end
