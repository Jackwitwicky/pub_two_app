# frozen_string_literal: true

class NewsLetterSubscriber
  include BaseSubscriber

  def call(topic)
    sub = upsert_subscription(topic)
    subscriber = sub.listen do |received_message|
      puts "The received data is: #{received_message}"
      received_message.acknowledge!
    end

    subscriber.on_error do |exception|
      puts "We got an exception! #{exception.message}"
    end

    subscriber.start
  end
end
