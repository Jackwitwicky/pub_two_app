# frozen_string_literal: true

require 'google/cloud/pubsub'

module BaseSubscriber

  def upsert_subscription(topic_name, subscription_name)
    push_config = Google::Cloud::PubSub::Subscription::PushConfig.new endpoint: "http://localhost:3000/api/subscriptions/receive"
    topic = upsert_topic(topic_name)
    topic.subscribe(subscription_name, push_config: push_config)
  end

  private

  def pubsub
    @pubsub ||= Google::Cloud::Pubsub.new(project_id: "some-project", emulator_host: 'localhost:8085')
  end

  def upsert_topic(name)
    ps_topic = begin
                 pubsub.create_topic(name)
               rescue Google::Cloud::AlreadyExistsError
                 pubsub.topic(name)
               end
  end
end
