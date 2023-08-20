# frozen_string_literal: true

# Migration to add a group reference to create_entities table.
class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :amount
      t.integer :author_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
