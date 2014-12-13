# Base class for all controllers
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :json

  self.responder = ApiResponder

  rescue_from Mongoid::Errors::DocumentNotFound do
    respond_with(nil, status: :not_found)
  end

end
