class PostsController < ApplicationController
  def index
    if logged_in?
      @posts = Post.all.order("created_at DESC").page(params[:page])
      @post = current_user.posts.build
    end
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
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cache)
  end
end
