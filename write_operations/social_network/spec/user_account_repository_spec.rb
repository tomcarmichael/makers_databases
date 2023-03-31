require "user_account"
require "user_account_repository"

def reset_user_accounts_table
  seed_sql = File.read('spec/seeds_user_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe UserAccountRepository do
  before(:each) do 
    reset_user_accounts_table
  end

  it "returns all user accounts in the table" do
    repo = UserAccountRepository.new
    users = repo.all
    expect(users.length).to eq 2
    expect(users.first.username).to eq 'dave'
    expect(users.first.email).to eq'dave@gmail.com'
    expect(users.last.username).to eq'john_lennon'
    expect(users.last.id).to eq 2
    expect(users.last.email).to eq 'dayinthelife@gmail.com'
  end

  it "finds a user account by id" do
    repo = UserAccountRepository.new
    user = repo.find(2)
    expect(user.username).to eq 'john_lennon'
    expect(user.id).to eq 2
    expect(user.email).to eq 'dayinthelife@gmail.com'
  end

  it "inserts a UserAccount object into table using #create" do
    user = UserAccount.new
    user.username = 'paul_mccartney'
    user.email = 'letitbe@hotmail.com'
    repo = UserAccountRepository.new
    repo.create(user)
    users = repo.all
    expect(users.length).to eq 3
    expect(users.last.username).to eq 'paul_mccartney'
    expect(users.last.email).to eq 'letitbe@hotmail.com'
    expect(users.last.id).to eq 3
  end

  it "Deletes a row from the table by id" do
    repo = UserAccountRepository.new
    repo.delete(2)
    users = repo.all
    expect(users.length).to eq 1
    expect(users.first.username).to eq 'dave'
    expect(users.first.email).to eq 'dave@gmail.com'
    expect(users.first.id).to eq 1
  end

end