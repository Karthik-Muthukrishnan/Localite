class PostLikesController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user,   only: :destroy

  	
  	def create
    	PostLike.create!(user_id: current_user.id, post_id: params[:post_like][:post_id])
      redirect_to root_url    
    end

    def destroy
      @plc = PostLike.find(params[:id])
      @plc.destroy
      redirect_to root_url
    end

    private

  
  	def correct_user
      @postlike = current_user.PostLikes.find_by_id(params[:id])
      redirect_to root_url if @postlike.nil?
    end

end