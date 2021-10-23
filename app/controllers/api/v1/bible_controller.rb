module Api
  module V1
    class BibleController < ApplicationController
      def index
        render json: ::Pipelines::BibleGatewayPipeline.call(verse_params)
      end

      def read
        ActionCable.server.broadcast(
          stream,
          ::Pipelines::BibleGatewayPipeline.call(verse_params)
        )
      end

      private

      def stream
        "bible_session_#{request.headers['HTTP_SESSION_TOKEN']}"
      end

      def verse_params
        params.permit(
          :translation_code,
          :book_name,
          :chapter_id,
          :verse_id
        )
      end
    end
  end
end
