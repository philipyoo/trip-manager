# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description 'Base User Type'

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :email, String, null: false
    field :id, ID, null: false
  end
end
