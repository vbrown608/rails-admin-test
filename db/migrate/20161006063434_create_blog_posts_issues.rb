class CreateBlogPostsIssues < ActiveRecord::Migration
  def change
    create_table :blog_posts_issues do |t|
      t.belongs_to :blog_post, index: true
      t.belongs_to :issue, index: true
    end
  end
end
