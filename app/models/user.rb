class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :reset_password_token, uniqueness: true, allow_nil: true
end
