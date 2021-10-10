require 'rails_helper'

describe Pipelines::BibleGatewayPipeline::Request do
  subject(:call) { described_class.call(params) }

  let(:params) do
    {
      book_name: 'Genesis',
      chapter_id: 1,
      verse_id: 1,
      translation_code: 'MBB'
    }
  end

  before do
    allow(described_class).to receive(:get).and_call_original
  end

  it 'calls get request' do
    expect(described_class).to receive(:get).with(
      '/passage',
      {
        query: {
          search: "Genesis 1:1",
          version: 'MBB'
        }
      }
    ).and_return('any passage')

    call
  end
end
