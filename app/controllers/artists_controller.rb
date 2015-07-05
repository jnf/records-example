class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(:name)
  end

  def show
    @label  = params[:label_id] && Label.find(params[:label_id])
    @artist = Artist.includes(:albums).find(params[:id])
  end
end
