# frozen_string_literal: true

# Migration to add a group reference to entities table.
class AddGroupToEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :group, null: false, foreign_key: true
  end
end
