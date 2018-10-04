module Placeholder
    extend ActiveSupport::Concern
    
    def self.image_generator(height:, width:)
        "https://via.placeholder.com/#{height}x#{width}"
    end
end

# this is a helper method that allows you to use string interp where it is called
# to call it you need to place include Placeholder at top then 
# Placeholder.image_generator(height:place number here , width:place number here)