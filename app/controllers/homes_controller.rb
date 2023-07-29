class HomesController < ApplicationController
  def top
    @menu = Menu.order(created_at: :desc)
    @menus = @menu.limit(4)
  end

  def about
  end
end
