class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
