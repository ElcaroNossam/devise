class ApplicationController < ActionController::Base
    

    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_doctor, :doctor_signed_in?, :require_doctor
    
    def after_sign_in_path_for(resource)
     categories_path
    end
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

   

    def current_doctor
      @current_doctor ||= Doctor.find(session[:doctor_id]) if session[:doctor_id]
    end
  
    def doctor_signed_in?
      !!current_doctor
    end
  
    def require_doctor
      if !doctor_signed_in?
        flash[:alert] = "You must be logged in to perform that action"
        redirect_to login_path
      end
    end

    protected
  
    def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation, :remember_me, :name, :number, :roles_mask]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
