class AddRelatedCaseToBlogPost < ActiveRecord::Migration
  def change
    create_table :blog_posts_legal_cases, id: false do |t|
      t.belongs_to :blog_post, index: true
      t.belongs_to :legal_case, index: true
    end
   end
end
