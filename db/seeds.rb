require 'faker'

10.times { Artist.create(name: Faker::Name.unique.name) }

counter = 1
id = 1

100.times do
  Album.create(title: Faker::Book.unique.title, artist_id: id)
    if counter % 10 == 0
      id += 1
    end
    counter += 1
end

counter = 1
id = 1

500.times do
  Song.create(title: Faker::Hipster.sentence(3), album_id: id)
    if counter % 5 == 0
      id += 1
    end
  counter += 1
end
