module ApplicationHelper
    #the style allows us to pass in dynamic classes based on different values 
    #look at _application_nav.html.erb to see how i passed in the 'nav-link style from the home page'
    def login_helper style
        if current_user.is_a?(GuestUser) 
            (link_to "Register", new_user_registration_path, class: style) +
            " ".html_safe +
            (link_to "Login", new_user_session_path, class: style)  
        else 
            link_to "Logout",destroy_user_session_path, class: style, method: :delete
        end   
    end    

    def source_helper
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}"
            content_tag(:p, greeting, class:'source-greeting')
        end 
    end
end
