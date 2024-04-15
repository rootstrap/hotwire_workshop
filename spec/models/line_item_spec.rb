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
require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:shopping_cart).optional }
    it { is_expected.to belong_to(:order).optional }
    it { is_expected.to belong_to(:product).required }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:unit_price).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:total_price).is_greater_than_or_equal_to(0) }

    context "quantity greater than product stock" do
      let!(:product) { create(:product, stock: 10) }

      subject { LineItem.new(quantity: 11, product: product) }

      it { is_expected.to validate_numericality_of(:quantity).is_less_than_or_equal_to(10) }
    end
  end
end
