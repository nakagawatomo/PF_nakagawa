class HomesController < ApplicationController
  def top
    @menus = Menu.limit(4)
  end

  def about
  end
end
