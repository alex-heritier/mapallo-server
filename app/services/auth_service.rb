# frozen_string_literal: true

class AuthService < BaseService
  def self.login(username, password_digest)
    user = User
           .joins(:login)
           .where('users.username = (?) AND logins.password_digest = (?)', username, password_digest).first
    return if user.nil?

    token = Token.create(user: user)
    [user, token]
  end
end
