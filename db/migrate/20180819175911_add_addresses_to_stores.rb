class AddAddressesToStores < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :store, foreign_key: true
  end
end
