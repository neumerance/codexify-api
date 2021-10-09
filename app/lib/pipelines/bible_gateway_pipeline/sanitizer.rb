module Pipelines
  class BibleGatewayPipeline
    class Sanitizer
      static_facade :sanitize, :string

      attr_accessor :sanitized_string

      class_attribute :removable_substring
      self.removable_substring = [
        '(A)',
        '[a]',
        '(,)'
      ].freeze

      def sanitize
        @sanitized_string = string
        sanitize_htmls
        sanitize_removable_string
        sanitized_string.squish
      end

      private

      def sanitize_htmls
        @sanitized_string = ActionView::Base.full_sanitizer.sanitize(sanitized_string)
      end

      def sanitize_removable_string
        removable_substring.each do |substring|
          @sanitized_string = sanitized_string.gsub(substring, '')
        end
      end
    end
  end
end
