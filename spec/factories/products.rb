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
FactoryBot.define do
  factory :product do
    category
    description { Faker::Lorem.sentence }
    state { Faker::Number.between(from: 0, to: 2) }
    stock { Faker::Number.number(digits: 2) }
    name { Faker::Lorem.word }
    unit_price { Faker::Number.number(digits: 3) }
    pictures { [Rack::Test::UploadedFile.new(File.open('spec/support/images/image.png'))] }
  end
end
