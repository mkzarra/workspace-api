class CreateJoinTableUsersStores < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :stores do |t|
      t.index :user_id
      t.index :store_id
    end
  end
end
