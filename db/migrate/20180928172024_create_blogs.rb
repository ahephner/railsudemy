#creates this for us in the db
class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
