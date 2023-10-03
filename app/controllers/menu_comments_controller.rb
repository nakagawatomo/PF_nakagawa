class MenuCommentsController < ApplicationController
  def create
    menu = Menu.find(params[:menu_id])
    comment = current_user.menu_comments.new(menu_comment_params)
    comment.menu_id = menu.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    MenuComment.find_by(id: params[:id], menu_id: params[:menu_id]).destroy
    redirect_to request.referer
  end

  private
  def menu_comment_params
    params.require(:menu_comment).permit(:comment)
  end
end