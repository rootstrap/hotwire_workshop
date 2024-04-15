# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :unit_price, null: false
      t.integer :state, null: false
      t.integer :stock, null: false
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
