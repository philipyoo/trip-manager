class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 255 },
    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password,
    length: { minimum: 6 }
end
