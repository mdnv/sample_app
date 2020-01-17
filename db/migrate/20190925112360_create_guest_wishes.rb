# frozen_string_literal: true

class CreateGuestWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :guest_wishes, &:timestamps
  end
end
