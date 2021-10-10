require 'uri'

module Pipelines
  class BibleGatewayPipeline
    class Request
      include HTTParty
      base_uri 'https://www.biblegateway.com'

      static_facade :call, :params

      def call
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
  end
end
