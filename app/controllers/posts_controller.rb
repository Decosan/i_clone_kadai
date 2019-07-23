class PostsController < ApplicationController
  before_action :require_user_login

  def index
    if logged_in?
      @posts = Post.all.order("created_at DESC").page(params[:page])
      if params[:back]
        @post = current_user.posts.build(post_params)
      else
        @post = current_user.posts.build
      end
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    @posts = Post.all.order("created_at DESC").page(params[:page])
  end

  def show
    @post = current_user.posts.find_by(id: params[:id])
  end

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] ='Post created!'
      redirect_to root_path
    else
      flash[:danger] ="Failed.."
      @posts = Post.all.order("created_at DESC").page(params[:page])
      render 'index'
    end
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:success] ="Edit complete!"
      redirect_to root_path
    else
      flash[:danger] ="Failed.."
      @posts = Post.all.order("created_at DESC").page(params[:page])
      render 'index'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:danger] ="Post deleted!!"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cache)
  end
end
