module SetSource
    extend ActiveSupport::Concern
    included do 
        before_action :set_source  
    end
    def set_source
        session[:source] = params[:q] if params[:q]
    end
end

 #set source of the session store information in cookie form and have access anywhere. 
    #the :q is where we are getting the query from could be anything but must be consistent
    #the if statement is incase there is no info