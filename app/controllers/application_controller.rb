class ApplicationController < ActionController::Base
    include DeviseWhiteList
    include SetSource
    #this is the main controller this before_action says run this before anything else
    #since we dont get devise controller this says if: youre the devise controller do this
    
    
    #super means dont change anything this is saying if current_user is true just use that else use other thing
    #current user was from devise
    def current_user
        super || OpenStruct.new(name: "Guest", first_name: "Guest", last_name: 'User', email: 'some@test.com')
    end    
 
end
