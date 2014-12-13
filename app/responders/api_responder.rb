#Responder for api responses
class ApiResponder < ActionController::Responder

  def to_format
    options.merge!(user: controller.current_user, location: nil)

    case
      when resource.is_a?(StandardError)
        display({ error: resource.message }, status: :bad_request)
      when put? && !has_errors?
        display(resource)
      else
        super
    end
  end


end