class DashboardController < ApplicationController

  before_filter :authorize

  def index
    dates = EventDate.where(event_id: current_user.events).includes(:event)
    @today = dates.today.order(:start_time)
    # @today = dates.order("random()").limit(7)
    # if today.empty?
    #   if Time.now.wday < 5
    #     @upcomming = dates.tomorrow
    #   else
    #     @upcomming = dates.day(date_of_next_monday)
    #   end
    # else
    #   @upcomming = today
    # end

    @user_events = current_user.events.sort_by(&:name)
  end

  private

  def date_of_next_monday
    date  = Date.parse("Monday")
    delta = date > Date.today ? 0 : 7
    date + delta
  end

end
