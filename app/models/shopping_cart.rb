# frozen_string_literal: true

# == Schema Information
#
# Table name: shopping_carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shopping_carts_on_user_id  (user_id)
#
class ShoppingCart < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy
end
