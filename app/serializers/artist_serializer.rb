class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :song, :album, :artist

  def album
    object.album.title
  end

  def artist
    object.name
  end

end
