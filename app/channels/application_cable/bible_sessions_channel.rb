class BibleSessionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from stream
  end

  private

  def stream
    "bible_session_#{params[:session_token]}"
  end

  private
end
