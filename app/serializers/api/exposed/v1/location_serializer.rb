class Api::Exposed::V1::LocationSerializer < ActiveModel::Serializer
  type :location

  attributes(
    :id,
    :latitude,
    :longitude,
    :place_name,
    :created_at,
    :updated_at
  )
end
