class AddTimestampsToContent < ActiveRecord::Migration
  def change
    change_table :blog_posts do |t|
      t.timestamps
    end

    change_table :legal_cases do |t|
      t.timestamps
    end


    change_table :issues do |t|
      t.timestamps
    end
  end
end
