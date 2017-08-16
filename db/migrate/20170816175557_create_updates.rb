class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :content_type, null: false
      t.integer :content_id, null: false

      t.timestamps
    end

    add_index "updates", "content_type", name: "index_updates_on_content_type"

    BlogPost.where(published: true).find_each{ |blog| Update.create(content: blog) }
    LegalCase.all.find_each{ |legal_case| Update.create(content: legal_case) }
  end
end
