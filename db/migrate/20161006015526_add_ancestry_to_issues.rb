class AddAncestryToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :ancestry, :string
    add_index :issues, :ancestry
    add_column :issues, :position, :integer
  end
end
