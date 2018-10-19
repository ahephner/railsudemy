class ApplicationController < ActionController::Base
    include DeviseWhiteList
    include SetSource
    #this is the main controller this before_action says run this before anything else
    #since we dont get devise controller this says if: youre the devise controller do this
    
    
   
    
     
end
