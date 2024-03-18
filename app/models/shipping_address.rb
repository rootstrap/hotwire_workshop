# frozen_string_literal: true

# == Schema Information
#
# Table name: shipping_addresses
#
#  id          :bigint           not null, primary key
#  country     :string           not null
#  city        :string           not null
#  state       :string           not null
#  line1       :string           not null
#  line2       :string
#  postal_code :string           not null
#  order_id    :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_shipping_addresses_on_order_id  (order_id)
#
class ShippingAddress < ApplicationRecord
  belongs_to :order

  validates :city, :country, :line1, :postal_code, :state, presence: true
end
