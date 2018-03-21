require('pg')

class Artist

attr_reader(:id, :name)

def initialize( collection )
  @id = collection['id']
  @name = collection['name']
end

def save

  sql = "INSERT INTO artists
  (
    name
  )
  VALUES
  (
    $1
  )
  RETURNING id
  "
  values = [@name]
  result = SqlRunner.run( sql,values )

  @id = result[0]['id'].to_i

end

def self.all()
    sql = "SELECT * FROM artists"
    collections = SqlRunner.run(sql)
    return collections.map { |collection| Artist.new(collection) }
end

def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
end


end
