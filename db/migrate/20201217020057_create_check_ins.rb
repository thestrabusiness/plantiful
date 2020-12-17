# frozen_string_literal: true

class CreateCheckIns < ActiveRecord::Migration[6.1]
  def change
    create_table :check_ins do |t|
      t.references :plant, null: false, index: true, foreign_key: true
      t.boolean :fertilized, default: false, null: false
      t.boolean :watered, default: false, null: false

      t.timestamps
    end
  end
end
