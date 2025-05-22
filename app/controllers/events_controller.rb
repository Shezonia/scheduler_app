class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      ReminderJob.set(wait_until: @event.scheduled_at).perform_later(@event.id)
      redirect_to @event, notice: "Event created. Reminder will be sent at scheduled time."
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :scheduled_at, :user_email)
  end
end
