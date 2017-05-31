require 'pg'
require 'pry-byebug'

require_relative '../db/SqlRunner'

class Artist

attr_accessor :name, :id

def initialize(deetz)
  @id = deetz['id'].to_i if deetz['id'] != nil
  @name = deetz['name']
end

def save()
  sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
  artist = SqlRunner.run(sql)
  @id = artist[0]['id'].to_i  
end

def self.all()
  sql = "SELECT * FROM artists;"
  results = SqlRunner.run(sql)
  return results.map {|artist_data| Artist.new(artist_data)}
end

def album()
  sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  result = SqlRunner.run(sql)
  return Album.new(result[0])
end




end
