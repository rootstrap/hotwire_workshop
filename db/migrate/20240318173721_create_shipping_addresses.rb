# frozen_string_literal: true

class CreateShippingAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :country, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :line1, null: false
      t.string :line2
      t.string :postal_code, null: false
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
