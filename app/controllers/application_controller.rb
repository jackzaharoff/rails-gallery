class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
# saves location so after login the user
# is back to the saved location
  after_filter :store_location

  protected
    def store_location
      # store last url - this is needed for post-login redirect to whatever the user last visited.
      if request.fullpath != '/sign_in' &&
          request.fullpath != '/users/sign_up' &&
          request.fullpath != '/users/password' &&
          !request.xhr? # don't store ajax calls
        session[:previous_url] = request.fullpath if request.format == 'text/html' || request.content_type == 'text/html'
      end
    end
    def after_sign_out_path_for(resource_or_scope)
      session[:previous_url] || root_path
    end
    def after_sign_in_path_for(resource)
      session[:previous_url] || root_path
    end
    def after_sign_up_path_for(resource)
      edit_user_registration_path(resource)
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :real_name) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :real_name) }
    end
end
