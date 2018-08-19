class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name :schedule, :wifi, :outlets, :restrooms, :seating, :atmosphere
end
