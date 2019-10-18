# == Schema Information
#
# Table name: pins
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  lat           :float
#  lng           :float
#  pinnable_type :text
#  pinnable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
