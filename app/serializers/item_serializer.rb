class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :price, :store_id
end
