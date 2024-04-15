# frozen_string_literal: true

# == Schema Information
#
# Table name: line_items
#
#  id               :bigint           not null, primary key
#  shopping_cart_id :bigint
#  product_id       :bigint           not null
#  order_id         :bigint
#  quantity         :integer          not null
#  unit_price       :decimal(, )      not null
#  total_price      :decimal(, )      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_line_items_on_order_id          (order_id)
#  index_line_items_on_product_id        (product_id)
#  index_line_items_on_shopping_cart_id  (shopping_cart_id)
#
class LineItem < ApplicationRecord
  belongs_to :shopping_cart, optional: true
  belongs_to :order, optional: true
  belongs_to :product

  validates :unit_price, :total_price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :quantity, numericality: { less_than_or_equal_to: :product_stock },
                       if: -> { product.present? }

  delegate :stock, to: :product, prefix: true
end
