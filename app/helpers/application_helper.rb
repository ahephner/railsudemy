module ApplicationHelper
    #the style allows us to pass in dynamic classes based on different values 
    #look at _application_nav.html.erb to see how i passed in the 'nav-link style from the home page'
    #!!!!Bug fix####
    #adding the empty = ''  to style method keeps it from having and error when you go to a section without style sets style to null unless changed 
    def login_helper style = ''
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
#store all of the nav paths here in this array
    def nav_items
        [
            {url: root_path,
            title: 'Home'},
            {url: pages_about_path,
            title: 'About'},
            {url: pages_contact_path,
            title: 'Contact Me'},
            {url: blogs_path,
            title: 'Blogs'},
            {url: portfolios_path,
            title: 'Portfolio' 
        }
        ]
    end 
#create a method to go through the array above and assign a nav link on the html
#this way we don't have to update new link for every section    
    def nav_helper style, tag_type
        nav_links = ''

        nav_items.each do |item|
            nav_links  << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
        end
        nav_links.html_safe
    end    
    
    def active? path
        "active" if current_page? path
      end

end
