# frozen_string_literal: true

class CreateGardens < ActiveRecord::Migration[6.1]
  def change
    create_table :gardens do |t|
      t.string :name, null: false, index: true

      t.timestamps
    end

    add_reference :plants, :garden, null: false, index: true, foreign_key: true
  end
end
