class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    @user = current_user
    @event = @user.created_events.build(event_params)

    if @event.save
      flash[:notice] = "You created:"
      redirect_to @event
    else
      flash.now[:alert] = "Event not saved!"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    p params
    @event = Event.find(params[:id])

    @event.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def event_params
    params.require(:event).permit(:date, :location, :name)
  end

end
