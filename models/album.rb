require('pg')

class Album

attr_reader(:id, :title, :genre, :artist_id)

def initialize( collection )
  @id = collection['id']
  @title = collection['title']
  @genre = collection['genre']
  @artist_id = (collection)['artist_id']
end

def save
  sql = "INSERT INTO albums
  (
    title,
    genre,
    artist_id
  )
  VALUES
  (
    $1,$2,$3
  )
  RETURNING id
  "
  values = [@title, @genre, @artist_id]
  result = SqlRunner.run( sql,values )

  @id = result[0]['id'].to_i

end

def self.all()
    sql = "SELECT * FROM albums"
    collections = SqlRunner.run(sql)
    return collections.map { |collection| Album.new(collection) }
end

def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
end


end
