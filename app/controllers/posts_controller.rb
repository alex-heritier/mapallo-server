# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    title = params[:title]
    text = params[:text]
    lat_lng = params[:lat_lng] || {}
    lat = lat_lng['lat'] || params[:lat]
    lng = lat_lng['lng'] || params[:lng]

    # Validate params
    if title.blank? || text.blank? || lat.blank? || lng.blank?
      return render json: {
        req_stat: 401,
        error_msg: 'Missing params'
      }
    end

    post = PostService.create_post(current_user, title, text, lat, lng)

    respond_to do |format|
      format.json do
        if post.present?
          render json: { req_stat: 100 }
        else
          render json: { req_stat: 400, error_msg: 'Failed to create post.' }
        end
      end
    end
  end
end
