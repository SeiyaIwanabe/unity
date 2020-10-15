class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @events = @user.events
    @entry_events = @user.entry_events # 追加
    #DM機能
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @haveRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @haveRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :genre, :introduction, :email, :password, :password_confirmation, :image )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
