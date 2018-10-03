class AddPostStatusBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :status, :integer, default: 0 
  end
end

# Creating the enum for published or not
# 1. rails g migration add_posts_blogs status:integer
# 2. open this file add the add_column line !Important i had to physically type it default jsut means where to start
# 3. run rails db:migrate
# 4. open blogs model 
# 5. add enum status{draft:1, publish:2}
# 6. rails c
# 7. Blogs.create!(title: 'test', body:'you got it') -> see if enum worked in output
# 8. Blogs.last.published set one to publish
# 9. Blogs.published.count -> 1 if working right
# 10. Blogs.draft.count 