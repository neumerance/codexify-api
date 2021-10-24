class ApplicationController < ActionController::API
  rescue_from ::Pipelines::BibleGatewayPipeline::PassageContentNotFound,
    with: :passage_content_not_found

  private

  def passage_content_not_found
    Rails.cache.delete(verse_params.values.join('/'))

    render json: {
      error: 'Unable to find content',
      params: verse_params
    }
  end

  def verse_params
    params.permit(
      :translation_code,
      :book_name,
      :chapter_id,
      :verse_id
    )
  end
end
