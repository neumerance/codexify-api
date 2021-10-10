module Api
  module V1
    class BibleController < ApplicationController
      def index
        render json: ::Pipelines::BibleGatewayPipeline.call(verse_params)
      end

      private

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
