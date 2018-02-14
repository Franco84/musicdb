class ArtistsController < ApplicationController

  def index
    render json: Artist.all
  end

  def search
    @songs = []
    @artists = Artist.where('lower(name) LIKE ?', "%" + artist_params[:search].downcase + "%").all
    @artists.each do |artist|
      @songs.push(artist.songs)
    end
    render json: @songs.flatten
  end

  private

  def artist_params
    params.require(:search).permit(:search)
  end

end
