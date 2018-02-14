class SongsController < ApplicationController

  def index
    render json: Song.all
  end

  def search
    @songs = Song.where('lower(title) LIKE ?', "%" + song_params[:search].downcase + "%").all
    render json: @songs
  end

  def search_all
    @music = []
    @music.push(Song.where('lower(title) LIKE ?', "%" + song_params[:search].downcase + "%").all)
    @artists = Artist.where('lower(name) LIKE ?', "%" + song_params[:search].downcase + "%").all
    @artists.each do |artist|
      @music.push(artist.songs)
    end
    @albums = Album.where('lower(title) LIKE ?', "%" + song_params[:search].downcase + "%").all
    @albums.each do |album|
      @music.push(album.songs)
    end
    render json: @music.flatten.uniq
  end

  private

  def song_params
    params.require(:search).permit(:search)
  end

end
