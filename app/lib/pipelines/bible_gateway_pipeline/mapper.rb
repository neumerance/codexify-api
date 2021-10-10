module Pipelines
  class BibleGatewayPipeline
    class Mapper
      static_facade :map, :html_string

      def map
        doc = Nokogiri::HTML(html_string)
        doc.css('.passage-content p').text
      end
    end
  end
end
