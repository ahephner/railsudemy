class ApplicationController < ActionController::Base
    include DeviseWhiteList
    include SetSource
    include UserType
    include DefaultPageData
    #this is the main controller this before_action says run this before anything else
    #since we dont get devise controller this says if: youre the devise controller do this
    # -this is before you load do this most of mine our in concerns but could do here using this then put function name after before_action
    before_action :set_copyright
    def set_copyright
        @copyright= HephnerCopy::Render.copyright 'AJ Hephner', 'All rights reserved'
    end
end
module HephnerCopy
    class Render
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
    
end