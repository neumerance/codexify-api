class BibleSessionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from stream
  end

  def receive(data)
    ActionCable.server.broadcast(
      stream,
      ::Pipelines::BibleGatewayPipeline.call(verse_params(data))
    )
  end

  private

  def stream
    "bible_session_#{params[:session_token]}"
  end

  private

  def verse_params(data)
    {
      translation_code: data[:translation_code],
      book_name: data[:book_name],
      chapter_id: data[:chapter_id],
      verse_id: data[:verse_id]
    }
  end
end
