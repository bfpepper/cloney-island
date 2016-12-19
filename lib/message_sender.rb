module MessageSender
  def self.send_code(phone_number, code)
    sid = ENV['twilio_sid']
    token = ENV['twilio_token']
    client = Twilio::REST::Client.new(sid, token)
    from_number = ENV['twilio_number']

    message = client.messages.create({
      from: from_number,
      to:   phone_number,
      body: code
    })

    message.status == 'queuded'
  end
end
