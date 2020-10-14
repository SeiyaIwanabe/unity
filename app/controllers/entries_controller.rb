class EntriesController < ApplicationController

  def create
    # @event = Event.find(params[:id])
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    @entry = current_user.entries.build(event_id: params[:event_id])
    # @event.update(applicant_id: current_user.id)
    if @entry.save
      redirect_to root_path
    else
      render template: "events/show"
    end
  end

  
end