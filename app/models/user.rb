class User
  has_secure_password

  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username
  validates_uniqueness_of :password
  # has_many rewards

  # enum role: %w(default admin)
end
