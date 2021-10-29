module Api
  module V1
    class BibleController < ApplicationController
      def index
        render json: ::Pipelines::BibleGatewayPipeline.call(verse_params)
      end

      def read
        data = ::Pipelines::BibleGatewayPipeline.call(verse_params)

        ActionCable.server.broadcast(stream, data)
      end

      private

      def stream
        "bible_session_#{request.headers['HTTP_SESSION_TOKEN']}"
      end

      def passage_content_not_found
        ActionCable.server.broadcast(stream, { not_found: 'Verse not found' })
      end
    end
  end
end
