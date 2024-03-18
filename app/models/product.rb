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
class Product < ApplicationRecord
  belongs_to :category

  has_many :line_items, dependent: :destroy

  has_many_attached :pictures

  enum state: { totaly_new: 0, almost_new: 1, used: 2 }

  validates :unit_price, numericality: { greater_than: 0 }
  validates :description, :state, :stock, :name, :unit_price, presence: true
end
