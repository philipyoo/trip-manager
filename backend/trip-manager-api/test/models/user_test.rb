require "test_helper"

TEST_EMAIL = 'TestUser@Example.com'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = perform(
      auth_provider: {
        credentials: {
          email: TEST_EMAIL,
          password: '[omitted]',
          password_confirmation: '[omitted]'
        }
      }
    )
  end

  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  def sign_in_user(args = {})
    Mutations::SignInUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  test 'create new user' do
    assert @user.valid?
    assert @user.persisted?
  end

  test "email should be saved lowercase" do
    assert_equal @user.email, TEST_EMAIL.downcase
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email should be unique, case insensitive" do
    user2 = @user.dup
    # uniqueness should be case insensitive
    user2.email = @user.email.upcase
    # save to generate errors
    @user.save

    assert_not user2.valid?
    assert user2.errors
    assert user2.errors[:email]
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@google.COM A_U-s+er@foo.bar.org first.last@foo.jp a+b@baz.cn]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_example.org user.name@example.foo@baz.com foo@bar+baz.cn]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5

    assert_not @user.valid?
  end

  test "user can login with correct password" do
    login_response = sign_in_user(
      credentials: {
        email: TEST_EMAIL,
        password: "[omitted]"
      }
    )

    assert_equal login_response[:user].email, @user.email
    assert login_response[:token]
  end

  test "user cannot login with incorrect password" do
    # TODO: need better response
    login_response = sign_in_user(
      credentials: {
        email: TEST_EMAIL,
        password: "INCORRECT_PASSWORD"
      }
    )

    assert_not login_response
  end

end
