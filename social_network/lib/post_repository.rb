require_relative 'post'

class PostRepository
  def all 
    sql = 'SELECT * FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    # returns a array of post objects
    posts = []
    result_set.each do |row|
      post = Post.new
      post.id = row['id'].to_i
      post.title = row['title']
      post.content = row['content']
      post.views = row['views'].to_i
      post.user_account_id = row['user_account_id'].to_i
      posts << post
    end

    return posts
  end

  def find(id) 
    sql = 'SELECT * FROM posts WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id]).first
    post = Post.new
    post.id = result['id'].to_i
    post.title = result['title']
    post.content = result['content']
    post.views = result['views'].to_i
    post.user_account_id = result['user_account_id'].to_i
    return post
  end

  def create(post) 
    sql = 'INSERT INTO posts (title, content, views, user_account_id) VALUES ($1, $2, $3, $4);'
    DatabaseConnection.exec_params(sql, [post.title, post.content, post.views, post.user_account_id])
    return nil
  end

  def delete(id) 
    sql = 'DELETE FROM posts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
    return nil
  end
end