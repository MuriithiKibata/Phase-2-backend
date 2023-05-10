class SaleSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :price
end
