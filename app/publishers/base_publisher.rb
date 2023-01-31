# frozen_string_literal: true

require 'google/cloud/pubsub'

module BasePublisher

  def upsert_topic(name)
    ps_topic = begin
                 pubsub.create_topic(name)
              rescue Google::Cloud::AlreadyExistsError
                pubsub.topic(name)
              end
  end

  private

  def pubsub
    @pubsub ||= Google::Cloud::Pubsub.new(project_id: "some-project", emulator_host: 'localhost:8085')
  end
end
