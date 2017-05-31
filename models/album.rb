require 'pg'
require 'pry-byebug'

class Album

  def initialize(deetz)
    @id = deetz['id'].to_i if deetz['id'] != nil
    @name = deetz['name']  
    @artist_id = deetz['artist_id'] if deetz['artist_id'] != nil  
    @genre = deetz['genre']
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id, genre) VALUES ('#{@name}', #{@artist_id}, '#{@genre}') RETURNING *;"
    album = SqlRunner.run(sql)
    @id = album[0]['id'].to_i
    
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    return results.map {|album_data| Album.new(album_data)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    return Artist.new(result[0])
  end

end