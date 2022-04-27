PICHANGA_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :integer, example: 666 },
    home_team_id: { type: :integer, example: 666, 'x-nullable': true },
    visitor_team_id: { type: :integer, example: 666, 'x-nullable': true },
    location_id: { type: :integer, example: 666, 'x-nullable': true },
    instructions: { type: :string, example: 'Some instructions', 'x-nullable': true },
    game_date: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
    results: { type: :string, example: 'Some results', 'x-nullable': true },
    created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
    updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
  },
  required: [
    :id
  ]
}

PICHANGAS_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    pichangas: {
      type: "array",
      items: { "$ref" => "#/definitions/pichanga" }
    }
  },
  required: [
    :pichangas
  ]
}

PICHANGA_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    pichanga: { "$ref" => "#/definitions/pichanga" }
  },
  required: [
    :pichanga
  ]
}
