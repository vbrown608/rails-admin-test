class CreateLegalCase < ActiveRecord::Migration
  def change
    create_table :legal_cases do |t|
      t.string :title
    end
  end
end
