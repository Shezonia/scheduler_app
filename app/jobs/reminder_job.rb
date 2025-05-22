class ReminderJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find_by(id: event_id)
    return unless event

    ReminderMailer.event_reminder(event).deliver_now
  end
end
