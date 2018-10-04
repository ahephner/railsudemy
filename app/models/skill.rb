class Skill < ApplicationRecord
  #1
    include Placeholder
    validates_presence_of :title, :percent_used

    after_initialize :set_default
#1
    def set_default
        self.badge ||= Placeholder.image_generator(height: 250, width: 250)
    end 
end


#1. this is from the concern file its a way to copy the image file as we want
#need to use include Placeholder to call class where the helper method is 
