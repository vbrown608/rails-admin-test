class CreateBlogPostsUsers < ActiveRecord::Migration
  def change
    create_table :blog_posts_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :blog_post, index: true
    end
  end
end
