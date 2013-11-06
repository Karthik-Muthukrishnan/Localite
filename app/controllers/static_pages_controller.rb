class StaticPagesController < ApplicationController
  def home
		if signed_in?
      		@post  = current_user.posts.build
      		@posts = current_user.feed.paginate(page: params[:page])
      		@bubbles = current_user.bubbles
    	end
	end

  def about
  end
end
