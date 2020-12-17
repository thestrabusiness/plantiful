class AddDeleteAtToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :deleted_at, :timestamp, null: true, index: true
  end
end
