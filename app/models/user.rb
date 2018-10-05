class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

#:confirmable have to click link sent in email first
# :lockable lockout after so many failed logins
# :timeoutable timeout session
# :trackable trackable
# :omniauthable allow 3rd party login 

# all above need other stuff to run need to google