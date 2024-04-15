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
FactoryBot.define do
  factory :shipping_address do
    country { Faker::Address.country_code }
    city { Faker::Address.city }
    state { Faker::Address.state }
    line_1 { Faker::Address.street_address }
    line_2 { Faker::Address.secondary_address }
    postal_code { Faker::Address.zip }
  end
end
