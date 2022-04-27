class Api::Exposed::V1::UserSerializer < ActiveModel::Serializer
  type :user

  attributes(
    :id,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :created_at,
    :updated_at,
    :name,
    :category
  )
end
