class CartSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :item_id
end
