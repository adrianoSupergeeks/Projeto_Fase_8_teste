class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, it: :devise_controller?
    
    protected
    
    def configure_permittef_parameter
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
    
end
