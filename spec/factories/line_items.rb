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
FactoryBot.define do
  factory :line_item do
    product
    quantity { Faker::Number.number(digits: 2) }
  end
end
