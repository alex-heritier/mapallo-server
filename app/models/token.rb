# frozen_string_literal: true

# == Schema Information
#
# Table name: tokens
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  value      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class Token < ApplicationRecord
  before_create :generate_value

  belongs_to :user

  def generate_value
    self[:value] ||= SecureRandom.uuid
  end
end
