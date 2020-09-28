class EntriesController < ApplicationController

  def create
    @entry = Entry.create(entry_params)
    if @entry.save
      redirect_to "/users/#{current_user.id}", notice: 'イベントへの申込みが完了しました。'
    else
      flash.now[:alert] = '申し込みフォームを正しく記入してください'
      # redirect_to controller: :events, action: :show
    end
    # redirect_to event_path(event.id)
    # if @user.save
    #   NotificationMailer.send_confirm_to_user(@user).deliver
    #   redirect_to @user
    # else
    #   render 'new'
    # end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params) && @entry.video.recreate_versions!
        format.html { redirect_to @entry, notice: 'Entry Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def entry_params
    params.require(:entry).permit(:name, :email, :phoneNumber)
  end
end
