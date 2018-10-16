class ApplicationController < ActionController::Base

    #this is the main controller this before_action says run this before anything else
    #since we dont get devise controller this says if: youre the devise controller do this
    before_action :configure_permitted_params, if: :devise_controller?

    #allow us to accept more information at login than  what devise comes out of the box with
    def configure_permitted_params
                                        #route      #what to accept
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end    
end
