require 'rails_helper'

RSpec.describe Artist, :type => :model do
  before(:each) do
    @artist = Artist.create!(name: "Metallica")
    @album1 = Album.create!(title: "Master of Puppets", artist_id: @artist.id)
    @album2 = Album.create!(title: "Metallica", artist_id: @artist.id)
    @song1 = Song.create!(title: "Battery", album_id: @album1.id)
    @song2 = Song.create!(title: "Nothing Else Matters", album_id: @album2.id)
  end

context 'validation' do
    it "is valid with a name" do
      expect(@artist).to be_valid
    end

    it "has many albums" do
      expect(@artist.albums.first.title).to eq("Master of Puppets")
    end

    it "has many songs" do
      expect(@artist.songs.first.title).to eq("Battery")
    end

  end
end
