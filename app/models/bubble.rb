class Bubble < ActiveRecord::Base
	
	# search for bubbles
	searchkick

	has_many :UserBubbleRelations, foreign_key: "bubble_id", dependent: :destroy
  	has_many :users, through: :UserBubbleRelations, source: :user
  	has_many :posts, foreign_key: "bubble_id", dependent: :destroy
  

	default_scope -> { order('name') }

	def following?(user)
    UserBubbleRelation.exists?(['user_id = ? and bubble_id = ?', 
                  user.id, self.id])
  end
  
end
