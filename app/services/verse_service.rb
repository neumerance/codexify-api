class VerseService
  static_facade :call, :translation_code, :book_name, :chapter_id, :verse_id

  def call
    verse_from_record || verse_from_api
  end

  def verse_from_record
    Verse.find_by(
      translation_code: translation_code,
      book_name: book_name,
      chapter_id: chapter_id,
      verse_id: verse_id
    )
  end

  def verse_from_api
    @verse_from_api ||= OpenStruct.new ::Pipelines::BibleGatewayPipeline.call(
      translation_code: translation_code,
      book_name: book_name,
      chapter_id: chapter_id,
      verse_id: verse_id
    )
  end
end
