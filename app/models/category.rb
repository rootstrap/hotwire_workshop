# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  description        :text
#  parent_category_id :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_categories_on_name                (name) UNIQUE
#  index_categories_on_parent_category_id  (parent_category_id)
#
class Category < ApplicationRecord
  has_many :subcategories,
           class_name: 'Category',
           foreign_key: 'parent_category_id',
           dependent: :destroy,
           inverse_of: :parent_category

  belongs_to :parent_category, class_name: 'Category', optional: true

  has_one_attached :picture

  validates :name, presence: true
end
