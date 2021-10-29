class VerseRecordJob < ActiveJob::Base
  def perform(translation_code, book_name, chapter_id, verse_id, content, title)
    ::Verse.create!(
      translation_code: translation_code,
      book_name: book_name,
      chapter_id: chapter_id,
      verse_id: verse_id,
      content: content,
      title: title
    )
  end
end
