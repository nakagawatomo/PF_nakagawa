class FavoritesController < ApplicationController
  def create
    menu = Menu.find(params[:menu_id])
    favorite = current_user.favorites.new(menu_id: menu.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    menu = Menu.find(params[:menu_id])
    favorite = current_user.favorites.find_by(menu_id: menu.id)
    favorite.destroy
    redirect_to request.referer
  end
end
