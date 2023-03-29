require "post"
require "post_repository"

def reset_posts_table
  seed_sql = File.read('spec/seeds_user_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end
  
  it "returns all posts" do
    repo = PostRepository.new
    posts = repo.all
    expect(posts.length).to eq 2
    expect(posts.first.title).to eq 'Complaint'
    expect(posts.first.content).to eq 'TDD is really annoying'
    expect(posts.first.views).to eq 500
    expect(posts.first.user_account_id).to eq 1
    expect(posts.last.id).to eq 2
    expect(posts.last.content).to eq 'My love will turn you on'
    expect(posts.last.title).to eq 'Oh Yoko'
    expect(posts.last.views).to eq 50000
    expect(posts.last.user_account_id).to eq 2
  end
  
  it "finds post by id" do
    repo = PostRepository.new
    post = repo.find(1)
    expect(post.id).to eq 1 
    expect(post.title).to eq 'Complaint'
    expect(post.content).to eq 'TDD is really annoying'
    expect(post.views).to eq 500
    expect(post.user_account_id).to eq 1
  end

  it "inserts new post into table using #create" do
    post = Post.new
    post.title = 'Across the Universe'
    post.content = 'Jai guru deva om'
    post.views = 1000000
    post.user_account_id = 2
    repo = PostRepository.new
    repo.create(post)
    posts = repo.all
    expect(posts.length).to eq 3 
    expect(posts.first.title).to eq 'Complaint'
    expect(posts.last.title).to eq 'Across the Universe'
    expect(posts.last.content).to eq 'Jai guru deva om'
    expect(posts.last.views).to eq 1000000
    expect(posts.last.user_account_id).to eq 2
  end
  
  it "deletes a post from the table by id" do
    repo = PostRepository.new
    repo.delete(2)
    posts = repo.all
    expect(posts.length).to eq 1
    expect(posts.first.title).to eq 'Complaint'
    expect(posts.first.content).to eq 'TDD is really annoying'
    expect(posts.first.views).to eq 500
    expect(posts.first.user_account_id).to eq 1
  end
end