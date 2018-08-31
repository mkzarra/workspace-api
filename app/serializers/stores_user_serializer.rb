class StoresUserSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :store_id
end
