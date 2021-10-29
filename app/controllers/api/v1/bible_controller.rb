module Api
  module V1
    class BibleController < ApplicationController
      def index
        render json: {
          translation_code: verse.translation_code,
          book_name: verse.book_name,
          chapter_id: verse.chapter_id,
          verse_id: verse.verse_id,
          content: verse.content
        }
      end

      def read
        ActionCable.server.broadcast(
          stream,
          {
            translation_code: verse.translation_code,
            book_name: verse.book_name,
            chapter_id: verse.chapter_id,
            verse_id: verse.verse_id,
            content: verse.content
          }
        )
      end

      private

      def verse
        @verse ||= ::VerseService.call(
          verse_params[:translation_code],
          verse_params[:book_name],
          verse_params[:chapter_id],
          verse_params[:verse_id]
        )
      end

      def stream
        "bible_session_#{request.headers['HTTP_SESSION_TOKEN']}"
      end

      def passage_content_not_found
        ActionCable.server.broadcast(stream, { not_found: 'Verse not found' })
      end
    end
  end
end
