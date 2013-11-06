class UserBubbleRelation < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :bubble, class_name: "Bubble"
  
  validates :bubble_id, presence: true
  validates :user_id, presence: true
end
