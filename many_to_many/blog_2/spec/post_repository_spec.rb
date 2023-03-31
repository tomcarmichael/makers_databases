require 'post_repository'
require 'pg'

def reset_posts_tags_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_2_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before :each do
    reset_posts_tags_tables
  end
  
  it "Finds all posts tagged with a given tag" do
    post_repository = PostRepository.new 
    posts = post_repository.find_by_tag('coding')
    expect(posts.length).to eq 4
    expect(posts.first.title).to eq 'How to use Git'
    expect(posts.last.title).to eq 'SQL basics'
    expect(posts[2].id).to eq '3'

    # The array `posts` should contain the following Post objects:
    #  * 1	How to use Git
    #  * 2	Ruby classes
    #  * 3	Using IRB
    #  * 7  SQL basics
  end
end 