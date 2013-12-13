class BubblesController < ApplicationController
	before_filter :signed_in_user
  
  
  def index
  	if params[:query].present?
      @bubbles_all = Bubble.search(params[:query], page: params[:page])
    else
     @bubbles_all = Bubble.paginate(page: params[:page])
    end 

    #@bubbles_all = Bubble.search("ambattur")

    
  	@bubbles = current_user.bubbles
  end
  
  def show
    @bubble = Bubble.find(params[:id])
    @posts = @bubble.posts.parentpost.paginate(page: params[:page])
    @post = @bubble.posts.build if signed_in?
    @bubbles = current_user.bubbles
  end
end
