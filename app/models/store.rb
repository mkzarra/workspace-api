class Store < ApplicationRecord
  belongs_to :users_stores
  has_one :address 
end
