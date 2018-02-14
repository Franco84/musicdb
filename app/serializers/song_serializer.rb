class SongSerializer < ActiveModel::Serializer
  attributes :id, :song, :album, :artist

  def album
    object.album.title
  end

  def artist
    object.album.artist.name
  end

  def song
    object.title
  end

end
