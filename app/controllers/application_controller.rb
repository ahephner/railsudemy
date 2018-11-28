class ApplicationController < ActionController::Base
    include DeviseWhiteList
    include SetSource
    include UserType
    include DefaultPageData
    #this is the main controller this before_action says run this before anything else
    #since we dont get devise controller this says if: youre the devise controller do this
    # -this is before you load do this most of mine our in concerns but could do here using this then put function name after before_action
    
    
 
end
