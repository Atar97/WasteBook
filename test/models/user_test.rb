# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  phone           :string
#  password_digest :string           not null
#  fname           :string           not null
#  lname           :string           not null
#  session_token   :string           not null
#  dob             :date             not null
#  admin           :boolean          default(FALSE), not null
#  gender          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
