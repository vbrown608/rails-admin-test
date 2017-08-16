class CreateTranslationTables < ActiveRecord::Migration
  def up
    BlogPost.create_translation_table!({ title: :string, body: :text },
                                       migrate_data: true,
                                       remove_source_columns: true)
  end

  def down
    BlogPost.drop_translation_table!(migrate_data: true)
  end
end
