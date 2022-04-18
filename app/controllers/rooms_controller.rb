class RoomsController < ApplicationController
  
 before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.create(room_params)
        if @room.save
          flash[:notice] = "Room created successfully."
          redirect_to @room
        else
          render :new, status: :unprocessable_entity
        end
  end

  def update
      if @room.update(room_params)
         flash[:notice] = "Room updated successfully."
         redirect_to @room
      else
         render :edit, status: :unprocessable_entity
      end
  end

  def destroy
     @room.destroy
     flash[:notice] = "Room Destroy successfully."  
     redirect_to root_path, status: :see_other
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_name, :capacity)
    end

end
