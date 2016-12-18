module MessageSender
  def self.send_code(phone_number, code)
    sid = ENV['twillo_sid']
    token = ENV['twillo_token']
    client = Twilio::REST::Client.new(sid, token)

    message = client.messages.create({
      from: ENV['twillo_number'],
      to:   phone_number,
      body: code
    })

    message.status == 'queuded'
  end
end
