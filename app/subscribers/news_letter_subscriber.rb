# frozen_string_literal: true

class NewsLetterSubscriber
  include BaseSubscriber

  TOPIC = "users"

  def call
    upsert_subscription(TOPIC, self.class.name)
  end

  def process(payload)
    puts "The request is being received by News Letter subscriber! #{payload}"
  end
end
