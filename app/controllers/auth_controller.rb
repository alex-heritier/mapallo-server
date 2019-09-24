# frozen_string_literal: true

class AuthController < ApplicationController
  def login
    username = params[:username]
    password = params[:password]

    return render json: { req_stat: 401, error_msg: 'Missing params' } if username.blank? || password.blank?

    @user = User.joins(:login).where('users.username = (?) AND logins.password_digest = (?)', username, password)

    respond_to do |format|
      format.json do
        if @user.present?
          render json: { user: @user, req_stat: 100 }
        else
          render json: { req_stat: 400, error_msg: 'Incorrect credentials' }
        end
      end
    end
  end
end
