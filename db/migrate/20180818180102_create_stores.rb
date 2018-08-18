class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :schedule
      t.boolean :wifi
      t.string :outlets
      t.string :restrooms
      t.string :seating
      t.string :atmosphere

      t.timestamps
    end
  end
end
