# frozen_string_literal: true

class PinsController < ApplicationController
  def index
    pins = Pin.all.includes(:user, :pinnable).as_json(include: [:pinnable, user: { only: [:username] }])
    render json: { req_stat: 100, pins: pins }
  end
end
