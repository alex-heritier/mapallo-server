# frozen_string_literal: true

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

class Pin < ApplicationRecord
  validates_presence_of :lat, :lng, :pinnable_type, :pinnable_id

  belongs_to :user
  belongs_to :pinnable, polymorphic: true
end
