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
    @event.images.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
      flash.now[:alert] = "イベント作成に成功しました"
    else
      @event.images.new
      render :new
      flash.now[:alert] = "イベント作成に失敗しました"
    end
  end

  private
  def event_params
    params.require(:event).permit(:eventname, :reward, :genre, :applicants, :place, :datetime, :details, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
