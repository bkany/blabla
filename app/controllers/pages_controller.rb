class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
    @items = Item.all
  end

end
