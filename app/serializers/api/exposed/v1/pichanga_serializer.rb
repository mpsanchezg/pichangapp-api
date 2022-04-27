class Api::Exposed::V1::PichangaSerializer < ActiveModel::Serializer
  type :pichanga

  attributes(
    :id,
    :home_team,
    :visitor_team,
    :location,
    :instructions,
    :game_date,
    :results,
    :created_at,
    :updated_at
  )
end
