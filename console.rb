require 'pry-byebug'
require_relative 'models/artist'
require_relative 'models/album'

artist1 = Artist.new({
  'name' => 'Tashmouth'
  })

artist1.save

artist2 = Artist.new({
  'name' => 'The Bear Naked Collies'
  })

artist2.save

binding.pry


album1 = Album.new({
  'name' => 'All VAR',
  'artist_id' => artist1.id,
  'genre' => 'Knit-grime'
  })
album1.save

album2 = Album.new({
  'name' => 'Cunt',
  'artist_id' => artist2.id,
  'genre' => 'Sloeberry Sex Jamz'
  })
album2.save


binding.pry
nil