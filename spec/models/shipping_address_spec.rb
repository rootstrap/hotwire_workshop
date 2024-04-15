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
require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:order).required }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:line1) }
    it { is_expected.to validate_presence_of(:postal_code) }
    it { is_expected.to validate_presence_of(:state) }
  end
end
