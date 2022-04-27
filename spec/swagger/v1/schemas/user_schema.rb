USER_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :integer, example: 666 },
    email: { type: :string, example: 'Some email' },
    encrypted_password: { type: :string, example: 'Some encrypted_password', 'x-nullable': true },
    reset_password_token: { type: :string, example: 'Some reset_password_token',
                            'x-nullable': true },
    reset_password_sent_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
    remember_created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
    created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
    updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
    name: { type: :string, example: 'Some name', 'x-nullable': true },
    category: { type: :string, example: 'Some category', 'x-nullable': true }
  },
  required: [
    :id,
    :email
  ]
}

USERS_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    users: {
      type: "array",
      items: { "$ref" => "#/definitions/user" }
    }
  },
  required: [
    :users
  ]
}

USER_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    user: { "$ref" => "#/definitions/user" }
  },
  required: [
    :user
  ]
}
