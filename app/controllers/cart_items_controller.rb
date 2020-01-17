# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy update]

  def create
    @product = Product.find(params[:product_id])
    @variant = Variant.find(params[:variant_id])
    current_cart.cart(@product, @variant, params[:cart_item][:quantity], params[:cart_item][:action])
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def update
    if @cart_item.quantity .between? 2, 14
      if params[:inc] == 'inc'
        @cart_item.update_attribute(:quantity, @cart_item.quantity += 1)
      end
      if params[:dec] == 'dec'
        @cart_item.update_attribute(:quantity, @cart_item.quantity -= 1)
      end
    end
    if @cart_item.quantity == 15
      if params[:inc] == 'inc'
        @cart_item.update_attribute(:quantity, @cart_item.quantity)
      end
      if params[:dec] == 'dec'
        @cart_item.update_attribute(:quantity, @cart_item.quantity -= 1)
      end
    end
    if @cart_item.quantity == 1
      if params[:inc] == 'inc'
        @cart_item.update_attribute(:quantity, @cart_item.quantity += 1)
      end
      if params[:dec] == 'dec'
        @cart_item.update_attribute(:quantity, @cart_item.quantity)
      end
    end
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referrer
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
