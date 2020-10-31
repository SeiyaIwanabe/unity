class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @events = @user.events
    @entry_events = @user.entry_events # 追加
    #DM機能
    @currentUserDeal = Deal.where(user_id: current_user.id)
    @userDeal = Deal.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserDeal.each do |cu|
        @userDeal.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @deal = Deal.new
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
