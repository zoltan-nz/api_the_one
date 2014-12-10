class Users::SessionsController < Devise::SessionsController
  class AuthenticationError < StandardError; end

  before_action :set_session

  # GET /resource/sign_in
  def new

  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def set_session
    binding.pry
    user_or_email = params[:session] && params[:session][:email] || current_user
    set_user(user_or_email)
    rescue AuthenticationError => e
      respond_with(e, status: :unauthorized)
  end

  def set_user(user_or_email)

    @user = if user_or_email.is_a?(User)
              user_or_email
            else
              User.find_for_database_authentication(email: user_or_email)
            end
    @csrf = form_authenticity_token
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

  def validate_authentication_attempt
    return if @user && @user.confirmed_at

    fail AuthenticationError, "please check your email address" unless @user
    fail AuthenticationError, "please follow the confirmation instructions sent to your email address"
  end

end
