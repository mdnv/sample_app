# frozen_string_literal: true

# == Schema Information
#
# Table name: products
class Product < ApplicationRecord
  GENDER = %w[Men Women Kids].freeze
  FRANCHISE = %w[Alphabounce Tubular].freeze
  PRODUCTTYPE = %w[Wear Underwear Pants].freeze
  BRAND = %w[Originals Athletics Essentials].freeze
  CATEGORY = %w[Shoes Compression Accessories Apparel].freeze
  SPORT = %w[Running Soccer Football].freeze

  has_many :variants, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :variants, reject_if: :all_blank, allow_destroy: true
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :wish_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :jan_code, presence: true, uniqueness: { case_sensitive: false },
                       length: { maximum: 13 }
  validates :name, presence: true,
                   length: { minimum: 1 }

  default_scope { order(id: :asc) }
end
