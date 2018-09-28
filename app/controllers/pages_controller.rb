#If you change the method name then everything else must change including routes models etc. 

class PagesController < ApplicationController
  def home
    #@something is a var
    @post = Blog.all 
    @skills = Skill.all 
  end

  def about
  end

  def contact
  end
end
