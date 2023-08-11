# frozen_string_literal: true

module Mutations
  class SignInUser < BaseMutation
    null true

    description 'POST request to login'

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      # TODO: need proper validation
      return unless credentials

      user = User.find_by(email: credentials[:email].downcase)

      return unless user
      return unless user.authenticate(credentials[:password])

      crypt = ActiveSupport::MessageEncryptor.new(
        Rails.application.credentials.secret_key_base.byteslice(0..31)
      )
      token = crypt.encrypt_and_sign("user-id:#{user.id}")

      { user:, token: }
    end
  end
end
