class AddAddressesToStores < ActiveRecord::Migration[5.1]
  def change
    add_reference :stores, :address, foreign_key: true
  end
end
