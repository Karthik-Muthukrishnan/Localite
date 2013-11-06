class UserBubbleRelationsController < ApplicationController
	before_filter :signed_in_user

  def create
    @bubble = Bubble.find(params[:user_bubble_relation][:bubble_id])
    UserBubbleRelation.create!(bubble_id: @bubble.id, user_id: current_user.id)
	
	respond_to do |format|
      format.html { redirect_to @bubble }
      / format.js /
    end
    
  end

  def destroy
    
    @ubr = UserBubbleRelation.find(params[:id])
    @bubble = Bubble.find(@ubr.bubble_id)
    @ubr.destroy 
    
    respond_to do |format|
      format.html { redirect_to @bubble }
      /format.js/
    end
    
  end

end
