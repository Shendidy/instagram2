class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :like]
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
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      flash.now[:alert] = "Couldn't update your Minsta, please try again or cancel!"
      render 'edit'
    end
  end

  def destroy
    # find_post
    if @post.destroy
      flash[:alert] = "Your Minsta has been deleted successfully"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "We couldn't delete your Minsta, please try again!"
      render 'show'
    end
  end

  def like
    # find_post
    @post.add_like
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :user_id, :image)
  end
end
