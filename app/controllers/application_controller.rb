# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_token
    request.headers['HTTP_TOKEN']
  end

  def current_user
    Token.find_by_value(current_token)&.user
  end
end
