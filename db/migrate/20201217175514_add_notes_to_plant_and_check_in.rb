# frozen_string_literal: true

class AddNotesToPlantAndCheckIn < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :notes, :string, null: true
    add_column :check_ins, :notes, :string, null: true
  end
end
