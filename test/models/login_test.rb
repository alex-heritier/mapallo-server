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

require 'test_helper'

class LoginTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
