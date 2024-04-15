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
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:user).required }
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_one(:shipping_address) }
    it { is_expected.to validate_numericality_of(:total_price).is_greater_than_or_equal_to(0) }
  end
end
