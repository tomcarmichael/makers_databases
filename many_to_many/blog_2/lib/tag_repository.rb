require_relative './tag'
require_relative './database_connection'

class TagRepository

  def find_by_post(post_title)
    sql = 'SELECT tags.id, name FROM tags
            JOIN posts_tags ON tags.id = tag_id
            JOIN posts ON post_id = posts.id
                WHERE title = $1;'
    result_set = DatabaseConnection.exec_params(sql, [post_title])

    tags = []

    result_set.each do |row|
      tag = Tag.new
      tag.id = row['id']
      tag.name = row['name']
      tags << tag
    end

    return tags
  end
end