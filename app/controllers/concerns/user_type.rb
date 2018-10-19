module UserType
    extend ActiveSupport::Concern

    #super means dont change anything this is saying if current_user is true just use that else use other thing
    #current user was from devise
    def current_user
        super || OpenStruct.new(name: "Guest", first_name: "Guest", last_name: 'User', email: 'some@test.com')
    end    
    
end