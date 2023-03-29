class UserAccountRepository
  def all 
    sql = 'SELECT * FROM user_accounts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    user_accounts = []
    result_set.each do |row|
      user_account = UserAccount.new
      user_account.id = row['id'].to_i
      user_account.username = row['username']
      user_account.email = row['email']
      user_accounts << user_account
    end

    return user_accounts
  end

  def find(id) 
    sql = 'SELECT * FROM user_accounts WHERE id = $1;'
    found = DatabaseConnection.exec_params(sql, [id]).first
    user_account = UserAccount.new
    user_account.id = found['id'].to_i
    user_account.username = found['username']
    user_account.email = found['email']
    return user_account
  end

  def create(user_account) 
    sql = 'INSERT INTO user_accounts (username, email) VALUES ($1, $2);'
    DatabaseConnection.exec_params(sql, [user_account.username, user_account.email])
    return nil
  end

  def delete(id) 
    sql = 'DELETE FROM user_accounts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
    return nil
  end
end