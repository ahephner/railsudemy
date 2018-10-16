class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
#this allows us to grab name for displaying on screen 
#like Hello AJ
#self.name = this.name 
#split.first out of box works on space so AJ H first is aj
  def first_name
    self.name.split.first
  end
  
  #split.last gives last value if there is only 1 value you still get that value here
  def last_name
    self.name.split.last
  end 
end



#:confirmable have to click link sent in email first
# :lockable lockout after so many failed logins
# :timeoutable timeout session
# :trackable trackable
# :omniauthable allow 3rd party login 

# all above need other stuff to run need to google