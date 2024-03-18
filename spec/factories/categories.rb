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
FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    picture { Rack::Test::UploadedFile.new(File.open('spec/support/images/image.png')) }
  end
end
