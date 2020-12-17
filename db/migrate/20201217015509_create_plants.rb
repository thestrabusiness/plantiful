# frozen_string_literal: true

class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name, null: false, index: true
      t.string :check_frequency_unit, null: false
      t.integer :check_frequency_scalar, null: false

      t.timestamps
    end
  end
end
