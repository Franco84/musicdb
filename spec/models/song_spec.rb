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
    it "is valid with a title" do
      expect(@song1).to be_valid
    end

    it "belongs to an album" do
      expect(@song1.album.title).to eq("Master of Puppets")
    end

    it "belongs to an artist through albums" do
      expect(@song2.album.artist.name).to eq("Metallica")
    end

  end
end
