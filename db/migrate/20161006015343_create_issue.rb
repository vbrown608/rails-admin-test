class CreateIssue < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :body
    end
  end
end
