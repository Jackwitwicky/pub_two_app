# frozen_string_literal: true

class UserPublisher
  include BasePublisher

  USER_TOPIC = 'users'

  def call(payload)
    topic = upsert_topic(USER_TOPIC)

    msg = topic.publish(payload)
    puts "The pub sub is: #{msg}"
  end
end
