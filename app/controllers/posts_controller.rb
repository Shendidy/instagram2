class PostsController < ApplicationController
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
