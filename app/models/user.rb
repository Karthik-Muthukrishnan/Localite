class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	has_many :UserBubbleRelations, foreign_key: "user_id", dependent: :destroy
  has_many :bubbles, through: :UserBubbleRelations, source: :bubble
  has_many :posts, foreign_key: "user_id", dependent: :destroy
  has_many :PostLikes, foreign_key: "user_id", dependent: :destroy
  
  



  validates :name,  presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  	has_secure_password
  	validates :password, length: { minimum: 6 }

  	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

    def feed
      Post.from_users_followed_by(self)
    end

    
    def alreadyLike?(post)
      PostLike.exists?(['user_id = ? and post_id = ?', 
                  self.id, post.id])
      
    end

  	private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
