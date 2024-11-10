class User < ApplicationRecord
  has_secure_password

  enum role: { admin: 0, advanced_user: 1, simple_user: 2 }
end
