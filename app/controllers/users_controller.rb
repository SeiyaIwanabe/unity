class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @events = @user.events
    @entry_events = @user.entry_events # 追加
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
