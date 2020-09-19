class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
    if logged_in?
      redirect_to posts_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      PostMailer.post_mail(@contact).deliver
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def icon
    @posts = current_user.favorite_posts
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end
