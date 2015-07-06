class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:artist).order(:title)
  end

  def show
    @album = Album.includes(:artist).find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_creation_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render action: :new
    end
  end

  private

  def album_creation_params
    params.require(:album).permit(:title, :label_code, :format, :released_year)
  end
end
