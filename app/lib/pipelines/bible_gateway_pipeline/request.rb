require 'uri'

module Pipelines
  class BibleGatewayPipeline
    class Request
      include HTTParty
      base_uri 'https://www.biblegateway.com'

      static_facade :call, :params

      def call
        Rails.cache.fetch(cache_key) do
          self.class.get(
            '/passage',
            {
              query: {
                search: "#{params[:book_name]} #{params[:chapter_id]}:#{params[:verse_id]}",
                version: params[:translation_code]
              }
            }
          )
        end
      end

      private

      def cache_key
        params.values.join('/')
      end
    end
  end
end
