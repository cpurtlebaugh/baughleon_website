class CreateBlogposts < ActiveRecord::Migration
  def up
    create_table :blogposts do |t|
      t.string :title
      t.text :body

      t.timestamps
  end
end

    def down
    drop_table :blogposts
    end
end
