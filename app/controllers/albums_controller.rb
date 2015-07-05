class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:artist).order(:title)
  end

  def show
    @album = Album.includes(:artist).find(params[:id])
  end
end
