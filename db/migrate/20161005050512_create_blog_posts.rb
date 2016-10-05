class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :body
      t.boolean :published
      t.boolean :promoted
    end
  end
end
