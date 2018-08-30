class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line_one, :line_two, :city, :state, :zip_code, :store
  belongs_to :store
end
