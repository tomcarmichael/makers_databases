require_relative './post'
require_relative './database_connection'


class PostRepository
  def find_by_tag(tag_name) # check arguments passed with double quotes
    sql = 'SELECT posts.id, title
              FROM posts JOIN posts_tags ON posts.id = post_id
              JOIN tags ON tag_id = tags.id
              WHERE name = $1;'
    result_set = DatabaseConnection.exec_params(sql, [tag_name])

    posts = []

    result_set.each do |row|
      post = Post.new
      post.id = row['id']
      post.title = row['title']
      posts << post
    end

    return posts
  end
end