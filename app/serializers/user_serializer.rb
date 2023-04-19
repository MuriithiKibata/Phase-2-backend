class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :carts
  has_many :stores
end
