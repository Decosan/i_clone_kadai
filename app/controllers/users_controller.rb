class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.order("created_at DESC")
    count(@user)
  end

  def like
    @user = User.find(params[:id])
    @posts = Post.all.order("created_at DESC")
    count(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ='Signed up!!'
      redirect_to users_path
    else
      flash[:danger] ='Failed..'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] ='Edit Completed!!'
      redirect_to user_path(@user)
    else
      flash[:danger] ='Failed..'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] ='Deleted!!'
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image,:image_cache)
  end
end
