require 'rails_helper'

describe Pipelines::BibleGatewayPipeline::Mapper do
  describe '#map' do
    subject(:map) { described_class.map(html_string) }

    context 'when content can be found' do
      let(:html_string) do
        '<html>'\
          '<body>'\
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

      it { is_expected.to be_blank }
    end
  end
end
