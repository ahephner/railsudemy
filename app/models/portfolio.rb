class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :second_image
end
