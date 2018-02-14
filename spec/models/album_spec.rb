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
      expect(@album1).to be_valid
    end

    it "belongs to an artists" do
      expect(@album1.artist.name).to eq("Metallica")
    end

    it "has many songs" do
      expect(@album2.songs.first.title).to eq("Nothing Else Matters")
    end

  end
end
