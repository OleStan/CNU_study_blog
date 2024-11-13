class Telegram::PublishPostService
  def initialize(post)
    @post = post
    @message = "New Blog Post: \n#{@post.title}\n#{@post.article.truncate(100)}\n"
  end

  def call
    begin
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: ENV["TELEGRAM_CHANNEL_ID"], text: @message)
    rescue Telegram::Bot::Exceptions::ResponseError => e
      Rails.logger.error("Failed to send message to Telegram: #{e.message}")
    end
  end
end
