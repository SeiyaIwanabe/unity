class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @currentRooms = current_user.rooms
  end

  def create
    @room = Room.create
    @deal1 = Deal.create(room_id: @room.id, user_id: current_user.id)
    @deal2 = Deal.create(params.require(:deal).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Deal.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @deals = @room.deals
    else
      redirect_back(fallback_location: root_path)
    end
  end

end
