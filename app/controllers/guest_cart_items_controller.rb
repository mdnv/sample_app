# frozen_string_literal: true

class GuestCartItemsController < ApplicationController
  before_action :set_guest_cart_item, only: %i[destroy update]

  def create
    @product = Product.find(params[:product_id])
    @variant = Variant.find(params[:variant_id])
    current_cart.cart(@product, @variant, params[:guest_cart_item][:quantity], params[:guest_cart_item][:action])
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def update
    if @guest_cart_item.quantity .between? 2, 14
      if params[:inc] == 'inc'
        @guest_cart_item.update_attribute(:quantity, @guest_cart_item.quantity += 1)
      end
      if params[:dec] == 'dec'
        @guest_cart_item.update_attribute(:quantity, @guest_cart_item.quantity -= 1)
      end
    end
    if @guest_cart_item.quantity == 15
      if params[:inc] == 'inc'
        @guest_cart_item.update_attribute(:quantity, @guest_cart_item.quantity)
      end
      if params[:dec] == 'dec'
        @guest_cart_item.update_attribute(:quantity, @guest_cart_item.quantity -= 1)
      end
    end
    if @guest_cart_item.quantity == 1
      if params[:inc] == 'inc'
        @guest_cart_item.update_attribute(:quantity, @guest_cart_item.quantity += 1)
      end
      if params[:dec] == 'dec'
        @guest_cart_item.update_attribute(:quantity, @guest_cart_item.quantity)
      end
    end
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def destroy
    @guest_cart_item.destroy
    redirect_to request.referrer
  end

  private

  def set_guest_cart_item
    @guest_cart_item = GuestCartItem.find(params[:id])
  end
end
