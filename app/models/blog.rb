class Blog < ApplicationRecord
  #this acts like a flag yes or no sets all kind of optons https://api.rubyonrails.org/v5.2.1/classes/ActiveRecord/Enum.html
  enum status:{draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
end
