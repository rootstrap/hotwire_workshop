# frozen_string_literal: true

class CreateShoppingCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_carts do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
