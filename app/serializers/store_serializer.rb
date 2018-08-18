class StoreSerializer < ActiveModel::Serializer
  attributes :id, :schedule, :wifi, :outlets, :restrooms, :seating, :atmosphere
end
