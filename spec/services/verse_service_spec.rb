require 'rails_helper'

describe VerseService do
  subject(:service) { described_class.call('MBBR', 'Genesis', 1, 1) }

  context 'when record doesnt exists' do
    before do
      allow(::Pipelines::BibleGatewayPipeline).to(
        receive(:call).and_return({
          translation_code: 'MBBR',
          book_name: 'Genesis',
          chapter_id: 1,
          verse_id: 1,
          content: 'scripture...',
          title: 'title...'
        })
      )
    end

    it 'returns object of verse' do
      expect(service.translation_code).to eq 'MBBR'
      expect(service.book_name).to eq 'Genesis'
      expect(service.chapter_id).to eq 1
      expect(service.verse_id).to eq 1
      expect(service.content).to eq 'scripture...'
      expect(service.title).to eq 'title...'
    end
  end

  context "when record exists" do
    before do
      create(
        :verse,
        translation_code: 'MBBR',
        book_name: 'Genesis',
        chapter_id: 1,
        verse_id: 1,
        content: 'scripture...',
        title: 'title...'
      )
    end

    it 'returns object of verse' do
      expect(service.translation_code).to eq 'MBBR'
      expect(service.book_name).to eq 'Genesis'
      expect(service.chapter_id).to eq 1
      expect(service.verse_id).to eq 1
      expect(service.content).to eq 'scripture...'
      expect(service.title).to eq 'title...'
    end
  end
end
