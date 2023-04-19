class CartSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity
end
