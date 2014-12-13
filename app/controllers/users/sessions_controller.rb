class Users::SessionsController < Devise::SessionsController
  before_action :set_service

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

  def set_service
    user_or_email = params[:session] && params[:session][:email] || current_user
    @service = SessionService.new(user_or_email, form_authenticity_token)
  rescue SessionService::AuthenticationError => e
    respond_with(e, status: :unauthorized)
  end
end
