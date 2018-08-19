class Store < ApplicationRecord
  belongs_to :stores_users
  has_one :address 
end
