class AddTitleToVerseModel < ActiveRecord::Migration[6.0]
  def change
    change_column :verses, :chapter_id, 'integer USING CAST(chapter_id AS integer)'
    change_column :verses, :verse_id, 'integer USING CAST(verse_id AS integer)'
    add_column :verses, :title, :string
  end
end
