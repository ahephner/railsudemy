class Portfolio < ApplicationRecord
    has_many :technologies
    #5
    accepts_nested_attributes_for :technologies, 
                                   reject_if: lambda { |x| x['name'].blank? }
    #4
    include Placeholder
    validates_presence_of :title, :body, :main_image, :second_image
#1
    def self.sql
        where(subtitle: "SQL")
    end
#2
    scope :ruby_on_rails, -> {where(subtitle: "Ruby")}

#3
    after_initialize :set_defaults 

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: 350, width: 150)
        self.second_image ||= Placeholder.image_generator(height: 100, width: 50)
    end

end

#1-Scope here we are setting what to return now go to controller and def index @port_items = Portfolio.sql will render only items with subtitle = SQL 
#2-Second way to scope

#3-Second way to set default values -first is in the schema like an Enum  
#this only happens at the create and is setting the values of the images
# ||= is a short hand way of doing the below
#     if self.main_image == nil
#         self.main_image = "https://via.placeholder.com/330x150"

# Without ||= the after_initialize would override any values so if you 
# are asking for a url to a picture and user provides it and you dont 
# use ||= then after_initialize would override with the values provided need a savepoint
#4. from the concern files allows us to copy over the url and pass the height and width
#5. allows us to create single portfolio item and slide in multiple technologies 
# reject_if: lambda is code for validation so it wont allow it to save with out a technologies name
# you can add multiple validations here, however, since we only have the name set up on technologies table thats all I can reject