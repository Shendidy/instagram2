class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all.order("updated_at DESC")
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => 'index'
    else
      flash.now[:notice] = "Error saving your new note, please try again!"
      redirect_to posts_url
    end
  end

  def show
    # find_post
  end

  def edit
    # find_post
  end

  def update
    # find_post
  end

  def destroy
    # find_post
    if @post.destroy
      flash[:alert] = "Your note has been deleted successfully"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "We couldn't delete your note, please try again!"
      render 'show'
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :user_id, :image)
  end
end
