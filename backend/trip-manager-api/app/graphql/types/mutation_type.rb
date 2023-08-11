# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    description 'All mutations'

    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
