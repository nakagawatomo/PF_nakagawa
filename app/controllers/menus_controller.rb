class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @menu = Menu.find(params[:id])
    @menu_comment = MenuComment.new
  end

  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    if @menu.save
      redirect_to menu_path(@menu), notice: "You have created menu successfully."
    else
      @menus = Menu.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to menu_path(@menu), notice: "You have updated menu successfully."
    else
      render "edit"
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :body, :image)
  end

  def ensure_correct_user
    @menu = Menu.find(params[:id])
    unless @menu.user == current_user
      redirect_to menus_path
    end
  end
end
