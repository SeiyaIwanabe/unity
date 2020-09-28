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

  def create
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
