class Store < ApplicationRecord
  has_many :stores_users
  has_many :users, through: :stores_users
  has_one :address 
end
