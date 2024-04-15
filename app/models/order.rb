# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  total_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy

  has_one :shipping_address, dependent: :destroy

  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
