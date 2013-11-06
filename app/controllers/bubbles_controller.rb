class BubblesController < ApplicationController
	before_filter :signed_in_user
  
  
  def index
  	@bubbles_all = Bubble.paginate(page: params[:page])
  	@bubbles = current_user.bubbles
  end
  
  def show
    @bubble = Bubble.find(params[:id])
    @posts = @bubble.posts.paginate(page: params[:page])
    @post = @bubble.posts.build if signed_in?
    @bubbles = current_user.bubbles
  end
end
