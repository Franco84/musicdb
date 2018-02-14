class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :album, :artist

  def artist
    object.artist.name
  end

  def album
    object.title
  end

end
