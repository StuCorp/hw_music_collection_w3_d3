require 'pg'
require 'pry-byebug'

class Album

  attr_accessor :id, :name, :artist_id, :genre

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

  def update()
    sql = "UPDATE albums SET (name, genre, artist_id) = ('#{@name}', '#{@genre}', #{@artist_id}) WHERE id = @id;"
    SqlRunner.run(sql)
  end

  def self.search(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    results = SqlRunner.run(sql)
    return results.map {|result| Artist.new(result)}
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    result = results[0]
    return Album.new(result)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    return Artist.new(result[0])
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
    end

end