class ApplicationController < ActionController::Base
    

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    def after_sign_in_path_for(resource)
     categories_path
    end
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
    protected
  
    def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation, :remember_me, :name, :number, :roles_mask]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
