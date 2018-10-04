class Portfolio < ApplicationRecord
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
        self.main_image ||= "https://via.placeholder.com/330x150"
        self.second_image ||= "https://via.placeholder.com/100x50"
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
# use ||= then after_initialize would override with the values provided