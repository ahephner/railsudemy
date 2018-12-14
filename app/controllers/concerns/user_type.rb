module UserType
    extend ActiveSupport::Concern

    #super means dont change anything this is saying if current_user is true just use that else use other thing
    #current user was from devise
    #OpenStruct.new(name: "Guest", first_name: "Guest", last_name: 'User', email: 'some@test.com')
    def current_user
        super || guest_user
    end    
    #this helps with the petergate had it like the openStruct above but it throws errors 
    #with the authorization stuff 
    def guest_user
        guest = GuestUser.new
        guest.name = 'Guest User'
        guest.first_name = 'Guest'
        guest.last_name = 'User'
        guest.email = 'guest@test.com'
        guest
    end 
end