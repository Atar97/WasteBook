# == Schema Information
#
# Table name: likes
#
#  id           :bigint(8)        not null, primary key
#  likable_type :string
#  likable_id   :bigint(8)
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Like < ApplicationRecord
end
