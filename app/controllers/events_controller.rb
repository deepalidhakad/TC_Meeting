class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show
      @room = people_check
  end

  def new
    @event = current_user.events.new
  end

  def edit
  end

  def create
    @event = current_user.events.new(event_params)
        if @event.save
          flash[:notice] = "Schedule created successfully."
          redirect_to @event
        else
          render :new, status: :unprocessable_entity
        end
  end

  def update
      if @event.update(event_params)
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
      params.require(:event).permit(:purpose, :people, :start_date, :end_date, :search)
    end

    def people_check
      if @event.people <= 2 
         @room = "Web Room."
      else
         @room = "PlugIn Room."
      end
    end
end
