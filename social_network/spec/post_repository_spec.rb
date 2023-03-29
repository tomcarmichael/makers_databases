def reset_posts_table
  seed_sql = File.read('spec/seeds_user_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_post_table
  end
  
  it "returns all posts" do
    repo = PostsRepository.new
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
  
  xit "finds post by id" do
    repo = PostsRepository.new
    post = find(1)
    expect(post.id).to eq 1 
    expect(post.title).to eq 'Complaint'
    expect(post.content).to eq 'TDD is really annoying'
    expect(post.views).to eq 500
    expect(post.user_account_id).to eq 1
  end

  it "inserts new post into table using #create"
    post = Post.new
    post.title = 'Across the Universe'
    post.content = 'Jai guru deva om'
    post.views = 1000000
    post.user_account_id = 2
    repo = PostsRepository.new
    posts = repo.all
    expect(posts.length).to eq 3 
    expect(posts.first.title).to 'Complaint'
    expect(posts.last.title).to 'Across the Universe'
    expect(posts.last.content).to 'Jai guru deva om'
    expect(posts.last.views).to 1000000
    expect(posts.last.user_account_id).to 2
  end
  
  it "deletes a post from the table by id"
    repo = PostsRepository.new
    repo.delete(2)
    posts = repo.all
    expect(posts.length).to 1
    expect(posts.first.title).to 'Complaint'
    expect(posts.first.content).to 'TDD is really annoying'
    expect(posts.first.views).to 500
    expect(posts.first.user_account_id).to 1
  end
end