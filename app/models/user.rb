class User < ActiveRecord::Base
	has_secure_password
  before_create

	validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, length: { in: 6..20 }

	def self.authenticate_with_credentials(email, password)
    puts User.find_by_email(email).authenticate(password)
  end

end
