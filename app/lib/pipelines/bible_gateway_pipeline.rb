require 'uri'

module Pipelines
  class BibleGatewayPipeline
    static_facade :call, :params

    def call
      response = Request.call(params)
      mapper = Mapper.map(response)

      content = mapper[:content]
      title = mapper[:title]

      sanitized_content = Sanitizer.sanitize(content)

      params.merge(content: sanitized_content, title: title)
    end

    private

    class PassageContentNotFound < StandardError; end
  end
end
