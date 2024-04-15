# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.belongs_to :shopping_cart, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :order, null: true, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :unit_price, null: false
      t.decimal :total_price, null: false

      t.timestamps
    end
  end
end
