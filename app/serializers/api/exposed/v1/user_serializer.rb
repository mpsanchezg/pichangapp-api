class Api::Exposed::V1::UserSerializer < ActiveModel::Serializer
  type :user

  attributes(
    :id,
    :email,
    :name,
    :category
  )
end
