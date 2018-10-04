# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |x|
    Topic.create!(
        title: "Topic #{x}"
    )
end

puts "topics"
10.times do |x|
  Blog.create!(
      title: "My Post #{x}", 
      body:  "Lorem ipsum dolor sit amet, 
      consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis 
        nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
         consequat. Duis aute irure dolor in reprehenderit in voluptate velit",
         topic_id: Topic.last.id 
  )
end 

#puts is equivalent to console.log or print
puts "blogs made"

5.times do |i|
    Skill.create!(
        title: "Skill #{i}",
        percent_used: "#{i}"
    )
end

puts "skills added"


8.times do |port|
    Portfolio.create!(
        title: "My project #{port}",
        subtitle: "SQL",
        body: "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis 
        nostrud exercitation ullamco laboris nisi ut aliquip", 
        main_image: "https://via.placeholder.com/330x150", 
        second_image:  "https://via.placeholder.com/100x50"
    )
end

1.times do |port|
    Portfolio.create!(
        title: "My project #{port}",
        subtitle: "Ruby",
        body: "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis 
        nostrud exercitation ullamco laboris nisi ut aliquip", 
        main_image: "https://via.placeholder.com/330x150", 
        second_image:  "https://via.placeholder.com/100x50"
    )
end
puts "9 portfolio made"