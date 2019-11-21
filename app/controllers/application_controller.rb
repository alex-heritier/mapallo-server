# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  around_action :around_api_request

  @@api_request_count = 1

  def current_token
    request.headers['HTTP_TOKEN']
  end

  def current_user
    Token.find_by_value(current_token)&.user
  end

  def around_api_request
    @@api_request_count += 1
    # request_id = @@api_request_count
    begin
      yield
    rescue StandardError => e
      puts "ERROR - #{e.message}"
      puts e.backtrace
      render json: {
        error_msg: 'server-side exception',
        req_stat: 420
      }
    end
  end
end
