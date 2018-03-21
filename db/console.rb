require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('sql_runner')
require('pry')


Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({'name' => 'The Smiths'})
artist2 = Artist.new({'name' => 'New Order'})
artist3 = Artist.new({'name' => 'Stone Roses'})

album1 = Album.new({'title' => 'Queen Is Dead', 'genre' => 'Rock', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'True Faith', 'genre' => 'Rock', 'artist_id' => artist2.id})
album3 = Album.new({'title' => 'Complete Stone Roses', 'genre' => 'Indie', 'artist_id' => artist3.id})
# album2 = Album.new({'title' => ''})

album1.save()
p album1
puts ""

album2.save()
p album2
puts ""

album3.save()
p album3
puts ""


artist1.save()
p artist1
puts ""

artist2.save()
p artist2
puts ""

artist3.save()
p artist3
puts ""

all_artists = Artist.all()
p all_artists

all_albums = Album.all()
p all_albums
