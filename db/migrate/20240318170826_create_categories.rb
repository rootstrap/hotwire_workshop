# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.references :parent_category, index: true, foreign_key: { to_table: :categories }

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
