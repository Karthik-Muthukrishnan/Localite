class Post < ActiveRecord::Base
	
  belongs_to :bubble
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :bubble_id, presence: true
  
  default_scope order: 'posts.created_at DESC'
  
  def self.from_users_followed_by(user)
    followed_bubble_ids = "SELECT bubble_id FROM User_Bubble_Relations
                         WHERE user_id = :user_id"
    where("bubble_id IN (#{followed_bubble_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  
end
