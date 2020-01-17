# frozen_string_literal: true

class CreateGuestCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :guest_carts, &:timestamps
  end
end
