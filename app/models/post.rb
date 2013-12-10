class Post < ActiveRecord::Base
	
  belongs_to :bubble
  belongs_to :user
  has_many :PostLike, foreign_key: "post_id", dependent: :destroy
  has_many :Comments, foreign_key: "post_id", dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :bubble_id, presence: true
  
  default_scope order: 'posts.created_at DESC'
  
  def self.from_users_followed_by(user)
    followed_bubble_ids = "SELECT bubble_id FROM User_Bubble_Relations
                         WHERE user_id = :user_id"
    where("comment_ind = 0 and (bubble_id IN (#{followed_bubble_ids}) OR user_id = :user_id)", 
          user_id: user.id)
  end

  def self.parentpost
    where("comment_ind = 0")
  end
  
  def self.getComments(post)
    comment_ids = "SELECT comment_id FROM comments
                         WHERE post_id = :post_id"
    where("id IN (#{comment_ids})", 
          post_id: post.id) 
  end

end
