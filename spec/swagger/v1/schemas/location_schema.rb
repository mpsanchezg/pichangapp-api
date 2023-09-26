LOCATION_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :integer, example: 666 },
    latitude: { type: :string, example: 'Some latitude', 'x-nullable': true },
    longitude: { type: :string, example: 'Some longitude', 'x-nullable': true },
    place_name: { type: :string, example: 'Some place_name', 'x-nullable': true },
    created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
    updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
  },
  required: [
    :id
  ]
}

LOCATIONS_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    locations: {
      type: "array",
      items: { "$ref" => "#/definitions/location" }
    }
  },
  required: [
    :locations
  ]
}

LOCATION_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    location: { "$ref" => "#/definitions/location" }
  },
  required: [
    :location
  ]
}
