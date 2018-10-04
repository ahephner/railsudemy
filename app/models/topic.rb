class Topic < ApplicationRecord
validates_presence_of :title 

#lets it know it owns blogs
has_many :blogs
end
