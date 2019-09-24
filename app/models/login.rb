# frozen_string_literal: true

# == Schema Information
#
# Table name: logins
#
#  id              :bigint           not null, primary key
#  user_id         :integer
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Login < ApplicationRecord
  validates_uniqueness_of :user_id
  validates_presence_of :user_id

  belongs_to :user, optional: true
end
