# frozen_string_literal: true

class PostService < BaseService
  def self.create_post(user, title, text, lat, lng)
    post = Post.create(user: user, title: title, text: text)
    Pin.create(user: user, pinnable: post, lat: lat, lng: lng)
    post
  end
end
