class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :stores_users, :id, :primary_key
  end
end
