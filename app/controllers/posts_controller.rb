class PostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @bubble = Bubble.find(params[:post][:bubble_id])
    
    @postn = current_user.posts.build(bubble_id: @bubble.id, 
          content: params[:post][:content])
    
    if @postn.save
      flash[:success] = "Posted successfully!"
    end
    redirect_to @bubble
  end

  def destroy
  	@post = Post.find(params[:id])
    @bubble = Bubble.find(@post.bubble_id)
    @post.destroy 
    
    redirect_to @bubble
  end
  
  private

  
  	def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
end
