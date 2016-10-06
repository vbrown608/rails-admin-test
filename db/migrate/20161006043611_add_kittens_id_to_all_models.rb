class AddKittensIdToAllModels < ActiveRecord::Migration
  def change
    add_column :issues, :id_from_kittens, :integer
    add_column :blog_posts, :id_from_kittens, :integer
    add_column :users, :id_from_kittens, :integer
    add_column :legal_cases, :id_from_kittens, :integer
  end
end
