class LineBotController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login, only: [:callback]

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']

    unless client.validate_signature(body, signature)
      return head :bad_request
    end

    events = client.parse_events_from(body)

    if events.empty?
      return head :ok # Webhook verification
    end

    events.each do |event|
      case event
      when Line::Bot::Event::Message
        handle_message_event(event)
      end
    end

    head :ok
  end

  private

  def handle_message_event(event)
    case event.type
    when Line::Bot::Event::MessageType::Text
      line_id = event['source']['userId']
      identifier = event.message['text']

      # 識別子を使ってユーザーを検索し、LINEのユーザーIDを関連付ける
      associate_line_id_with_user(line_id, identifier)
    end
  end

  def associate_line_id_with_user(line_id, identifier)
    user = User.find_by(identifier: identifier)
    if user
      user.update(line_id: line_id)
      send_message(line_id, "アカウントの連携に成功しました。")
    else
      send_message(line_id, "アカウントの識別子が見つかりませんでした。")
    end
  end

  def send_message(line_id, text)
    message = {
      type: 'text',
      text: text
    }
    client.push_message(line_id, message)
  end

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
  end
end