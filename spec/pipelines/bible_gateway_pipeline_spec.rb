require 'rails_helper'

describe Pipelines::BibleGatewayPipeline do
  describe '#call' do
    subject(:call) { described_class.call(params) }

    let(:params) do
      {
        book_name: 'Genesis',
        chapter_id: 1,
        verse_id: 1,
        translation_code: 'MBB'
      }
    end
    let(:content) { 'Any content' }

    before do
      allow(described_class::Request).to receive(:call).and_return(content)
      allow(described_class::Mapper).to receive(:map).and_return({ title: 'Any title', content: content })
      allow(described_class::Sanitizer).to receive(:sanitize).and_return(content)
    end

    it 'returns hash' do
      expect(call).to eq(
        book_name: 'Genesis',
        chapter_id: 1,
        verse_id: 1,
        translation_code: 'MBB',
        content: 'Any content',
        title: 'Any title'
      )
    end
  end
end
