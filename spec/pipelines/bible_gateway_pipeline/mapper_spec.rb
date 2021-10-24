require 'rails_helper'

describe Pipelines::BibleGatewayPipeline::Mapper do
  describe '#map' do
    subject(:map) { described_class.map(html_string) }

    describe 'content' do
      subject(:content) { map[:content] }

      context 'when content can be found' do
        let(:html_string) do
          '<html>'\
            '<body>'\
              '<span class="dropdown-display-text">label</span>'\
              '<div class="passage-content">'\
                '<p>Any content</p>'\
              '</div>'\
            '</body>'\
          '</html>'
        end

        it { is_expected.to eq 'Any content' }
      end

      context 'when content can\'t be found' do
        let(:html_string) do
          '<html>'\
            '<body>'\
              '<div class="passage-text">'\
                '<p>Any content</p>'\
              '</div>'
            '</body>'\
          '</html>'
        end

        it 'raise exception' do
          expect { content }.to raise_error(::Pipelines::BibleGatewayPipeline::PassageContentNotFound)
        end
      end
    end

    describe 'title' do
      subject(:title) { map[:title] }

      context 'when title can be found' do
        let(:html_string) do
          '<html>'\
            '<body>'\
              '<span class="dropdown-display-text">label</span>'\
              '<div class="passage-content">'\
                '<p>Any content</p>'\
              '</div>'\
            '</body>'\
          '</html>'
        end

        it { is_expected.to eq 'label' }
      end

      context 'when title can\'t be found' do
        let(:html_string) do
          '<html>'\
            '<body>'\
              '<div class="passage-text">'\
                '<p>Any content</p>'\
              '</div>'
            '</body>'\
          '</html>'
        end

        it 'raise exception' do
          expect { title }.to raise_error(::Pipelines::BibleGatewayPipeline::PassageContentNotFound)
        end
      end
    end
  end
end
