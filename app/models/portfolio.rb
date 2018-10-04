class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :second_image
#1
    def self.sql
        where(subtitle: "SQL")
    end
#2
    scope :ruby_on_rails, -> {where(subtitle: "Ruby")}
end

#1-Scope here we are setting what to return now go to controller and def index @port_items = Portfolio.sql will render only items with subtitle = SQL 
#2-Second way to scope