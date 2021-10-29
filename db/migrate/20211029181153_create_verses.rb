class CreateVerses < ActiveRecord::Migration[6.0]
  def change
    create_table :verses do |t|
      t.string :book_name
      t.string :chapter_id
      t.string :verse_id
      t.string :translation_code
      t.text   :content
      t.timestamps
    end

    add_index :verses,
      [:translation_code, :book_name, :chapter_id, :verse_id],
      name: :bible_verse_search_index,
      unique: true
  end
end
