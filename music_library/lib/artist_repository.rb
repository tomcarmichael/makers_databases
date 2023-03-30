class ArtistRepository

  def print

    sql = 'SELECT name, genre FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])

    fstring = ["Here is the list of artists"] 

    result_set.each do |record|
      line = " * #{record['name']} - #{record['genre']}"
      fstring << line
    end

    return fstring
  end
end