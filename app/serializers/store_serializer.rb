class StoreSerializer < ActiveModel::Serializer
  attributes :id, :schedule, :wifi, :outlets, :restrooms, :seating, :atmosphere, :name
end
