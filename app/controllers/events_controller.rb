class EventsController < ApplicationController
  
 before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = current_user.events.new
  end

  def edit
  end

  def create
    @event = current_user.events.create(event_params)
        if @event.save
          EventMailer.with(event: @event).event_send.deliver_now
          flash[:notice] = "Schedule created successfully."
          # @time = @event.start_date - 900
          # ConfirmMailer.with(event: @event).confirm_send.deliver_later(wait_until: @time)
          redirect_to @event
        else
          render :new, status: :unprocessable_entity
        end
  end

  def update
      if @event.update(event_params)
         UpdateMailer.with(event: @event).update_send.deliver_now
         flash[:notice] = "Schedule updated successfully."
         redirect_to @event
      else
         render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @event.destroy
     flash[:notice] = "Schedule Destroy successfully."  
     redirect_to root_path, status: :see_other
  end

  def search
      @event = params[:query]
      @events = Event.where("events.purpose like ?", ["%#{@event}%"])
      render :index
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:purpose, :people, :start_date, :end_date, :search, :room_id)
    end

end
