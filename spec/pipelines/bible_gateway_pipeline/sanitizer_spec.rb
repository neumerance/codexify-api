require 'rails_helper'

describe Pipelines::BibleGatewayPipeline::Sanitizer do
  subject(:call) { described_class.sanitize(unsanitized_string) }

  let(:unsanitized_string) do
    'Hello(A) there this string[a] will be sanitized shortly(,)'
  end

  it { is_expected.to eq 'Hello there this string will be sanitized shortly' }
end
