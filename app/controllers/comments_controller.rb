class CommentsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @comment = Comment.create(comment_params)
    redirect_to event_path(params[:event_id])
    # respond_to do |format|
    #   format.html { redirect_to event_path(params[:event_id]), data: {"turbolinks" => false} }
    #   format.json
    # end
    # redirect_to event_path(params[:event_id])
    #投稿に紐づいたコメントを作成
    # @comment.user_id = current_user.id
    # @comment.save
    # render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    if user_signed_in? && current_user.id == @comment.user_id && @comment.destroy
      @comment.destroy
      redirect_to event_path(params[:id]), data: {"turbolinks" => false}
    else
      redirect_to event_path(params[:id]), data: {"turbolinks" => false}, alert: :"ログイン済みのコメント投稿者本人のみがコメントを削除できます。"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
