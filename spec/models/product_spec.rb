# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  unit_price  :decimal(, )      not null
#  state       :integer          not null
#  stock       :integer          not null
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:category).required }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:stock) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:unit_price).is_greater_than(0) }
  end
end
