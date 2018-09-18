# == Schema Information
#
# Table name: photos
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  user_id    :integer          not null
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  include Commentable
  include Likeable
  
  belongs_to :user

  belongs_to :post
end
