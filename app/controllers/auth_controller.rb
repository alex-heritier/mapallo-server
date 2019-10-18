# frozen_string_literal: true

class AuthController < ApplicationController
  def login
    username = params[:username]
    password = params[:password]
    return render json: { req_stat: 401, error_msg: 'Missing params' } if username.blank? || password.blank?

    user, token = AuthService.login(username, Login.encrypt_password(password))

    respond_to do |format|
      format.json do
        if user.present? && token.present?
          render json: { user: user, token: token.value, req_stat: 100 }
        else
          render json: { req_stat: 400, error_msg: 'Incorrect credentials' }
        end
      end
    end
  end

  def signup
    # Validate params
    username = params[:username]
    password = params[:password]
    return render json: { req_stat: 401, error_msg: 'Missing params' } if username.blank? || password.blank?

    # Sign Up
    user = User.create(username: username)
    return render json: { req_stat: 401, error_msg: 'Invalid username' } if user.nil?

    login = Login.create(user: user, password_digest: Login.encrypt_password(password))
    if login.nil?
      user.delete
      return render json: { req_stat: 401, error_msg: 'Registration failed.' }
    end

    # Login after successful sign up
    user, token = AuthService.login(username, Login.encrypt_password(password))

    respond_to do |format|
      format.json do
        if user.present? && token.present?
          render json: { user: user, token: token.value, req_stat: 100 }
        else
          render json: { req_stat: 400, error_msg: 'Registration failed.' }
        end
      end
    end
  end
end
