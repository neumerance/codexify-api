require 'uri'

module Pipelines
  class BibleGatewayPipeline
    static_facade :call, :params

    def call
      response = Request.call(params)
      mapped_content = Mapper.map(response)

      raise PassageContentNotFound unless mapped_content.present?

      sanitized_content = Sanitizer.sanitize(mapped_content)

      params.merge(content: sanitized_content)
    end

    class PassageContentNotFound < StandardError; end
  end
end
