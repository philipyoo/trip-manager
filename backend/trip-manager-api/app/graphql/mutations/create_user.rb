module Mutations
  class CreateUser < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(name: nil, auth_provider: nil)
      password = auth_provider&.[](:credentials)&.[](:password)
      password_confirmation = auth_provider&.[](:credentials)&.[](:password_confirmation)

      return unless password == password_confirmation

      User.create!(
        email: auth_provider&.[](:credentials)&.[](:email),
        password: password,
        password_confirmation: password_confirmation,
      )
    end
  end
end
