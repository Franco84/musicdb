class AlbumsController < ApplicationController

  def index
    render json: Album.all
  end

  def search
    @songs = []
    @albums = Album.where('lower(title) LIKE ?', "%" + album_params[:search].downcase + "%").all
    @albums.each do |album|
      @songs.push(album.songs)
    end
    render json: @songs.flatten
  end

  private

  def album_params
    params.require(:search).permit(:search)
  end

end
