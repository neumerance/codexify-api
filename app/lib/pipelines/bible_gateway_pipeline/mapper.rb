module Pipelines
  class BibleGatewayPipeline
    class Mapper
      static_facade :map, :html_string

      def map
        doc = Nokogiri::HTML(html_string)

        dropdown_texts = doc.css('.dropdown-display-text')
        content =  doc.css('.passage-content p')

        raise PassageContentNotFound unless dropdown_texts.present? && content.present?

        {
          title: dropdown_texts.at(0).text,
          content: content.text,
        }
      end
    end
  end
end
