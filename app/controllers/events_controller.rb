class EventsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:show]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @entry = Entry.new
    # @entries = @event.entry.includes(:user)
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
  end

  private
  def event_params
    params.require(:event).permit(:eventname, :image, :reward, :genre, :applicants, :place, :datetime, :details)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
