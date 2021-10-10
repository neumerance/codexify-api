class ApplicationController < ActionController::API
  rescue_from ::Pipelines::BibleGatewayPipeline::PassageContentNotFound,
    with: :passage_content_not_found

  private

  def passage_content_not_found
    render json: {
      error: 'Unable to find content',
      params: params
    }
  end
end
