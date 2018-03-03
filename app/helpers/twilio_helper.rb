module TwilioHelper
  def send_sms message
    @client = Twilio::REST::Client.new 

    @client.api.v2010.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: message.number,
      body: message.text
)
  end

  def send_cable message
    html = render_message(message)

    ActionCable.server.broadcast 'messages',
      number: message.number,
      html: html
  end

  def render_message message
    ApplicationController.render({
      partial: 'messages/message',
      locals: { message: message }
    })
  end
end