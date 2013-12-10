class PostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    if params[:post][:comment_ind] == false
      @bubble = Bubble.find(params[:post][:bubble_id])
      
      @postn = current_user.posts.build(bubble_id: @bubble.id, 
            content: params[:post][:content], comment_ind: false)
      
      if @postn.save
        flash[:success] = "Posted successfully!"
      end     
      redirect_to @bubble
    else
      @parent_post = Post.find(params[:post][:id])
      @postn = current_user.posts.build(bubble_id: @parent_post.bubble_id, content: params[:post][:content], comment_ind: true)
      @postn.save
      Comments.create!(post_id: @parent_post.id ,comment_id: @postn.id)  
      flash[:success] = "Commented successfully!"
      redirect_to root_url
    end

  end

  def destroy
  	@post = Post.find(params[:id])
    @bubble = Bubble.find(@post.bubble_id)
    @comments = Post.getComments(@post)

    if @comments.any?
      @comments.destroy
    end

    @post.destroy 
    
    redirect_to @bubble
  end
  
  private

  
  	def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
end
