class CustomStoreSerializer < ActiveModel::Serializer
  ttributes :id, :name, :user_id, :items
  belongs_to :user
  has_many :items
end
