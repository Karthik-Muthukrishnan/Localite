class UsersController < ApplicationController
   before_action :signed_in_user, only: [:index, :edit, :update]
   before_action :correct_user,   only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.parentpost.paginate(page: params[:page])
    @bubbles = @user.bubbles
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Localite!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(per_page: 20,page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
