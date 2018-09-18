# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  body             :text             not null
#  commentable_type :string
#  commentable_id   :bigint(8)
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  include Likeable

  belongs_to :user

  belongs_to :commentable, polymorphic: true

end
