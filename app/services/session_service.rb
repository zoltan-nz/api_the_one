# Encapsulates interaction logic for user session

class SessionService
  class AuthenticationError < StandardError; end

  attr_reader :user

  def initialize(user_or_email, csrf_token)
    @user = if user_or_email.is_a?(User)
              user_or_email
            else
              User.find_for_database_authentication(email: user_or_email)
            end
    @csrf = csrf_token
    validate_authentication_attempt
  end

  def authenticate!(password, remember_me = false)
    @user.remember_me = remember_me
    return if @user.valid_password?(password)

    fail AuthenticationError, "invalid email or password"
  end

  def session
    {
        session: {
            id:      @user.id.to_s,
            email:   @user.email,
            csrf:    @csrf,
            user_id: @user.id.to_s
        },
        users: [@user.as_json(root: false)]
    }
  end

  private

  def validate_authentication_attempt
    return if @user && @user.confirmed_at

    fail AuthenticationError, "please check your email address" unless @user
    fail AuthenticationError, "please follow the confirmation instructions sent to your email address"
  end
end