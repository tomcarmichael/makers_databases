require 'tag_repository'

def reset_posts_tags_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_2_test' })
  connection.exec(seed_sql)
end

describe TagRepository do 
  before :each do
    reset_posts_tags_tables
  end

  it 'Find tags by post' do
    repo = TagRepository.new
    posts = repo.find_by_post('Using IRB')
    expect(posts.length).to eq 2
    expect(posts.first.name).to eq 'coding'
    expect(posts.last.name).to eq 'ruby'
    expect(posts.first.id).to eq '1'
    expect(posts.last.id).to eq '4'

    # should return the rows: 
    # 1 * 'coding' 
    # 4 * 'ruby'
  end
end