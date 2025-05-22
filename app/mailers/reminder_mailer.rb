class ReminderMailer < ApplicationMailer
  def event_reminder(event)
    @event = event
    mail(to: @event.user_email, subject: "Reminder: #{@event.title}")
  end
end
