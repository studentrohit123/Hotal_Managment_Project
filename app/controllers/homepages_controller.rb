class HomepagesController < ApplicationController

  def index
    @hotels = Hotel.all
  end
end