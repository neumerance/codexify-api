require 'uri'

module Pipelines
  class BibleGatewayPipeline
    static_facade :call, :params

    attr_accessor :verse

    def call
      response = Request.call(params)
      mapper = Mapper.map(response)

      content = mapper[:content]
      title = mapper[:title]

      sanitized_content = Sanitizer.sanitize(content)

      @verse = params.merge(content: sanitized_content, title: title)

      record_verse

      @verse
    end

    private

    def record_verse
      ::VerseRecordJob.perform_later(
        verse[:translation_code],
        verse[:book_name],
        verse[:chapter_id],
        verse[:verse_id],
        verse[:content],
        verse[:title]
      )
    end

    class PassageContentNotFound < StandardError; end
  end
end
