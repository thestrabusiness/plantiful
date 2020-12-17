# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end

    create_table :gardens_users do |t|
      t.references :garden, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end

    add_reference :plants, :added_by, null: false, index: true, foreign_key: { to_table: :users }
    add_reference :gardens, :owner, null: false, index: true, foreign_key: { to_table: :users }
    add_reference :check_ins, :performed_by, null: false, index: true, foreign_key: { to_table: :users }
  end
end
