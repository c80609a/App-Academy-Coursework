class PostsController < ApplicationController

  before_action :require_logged_in, except: :show
  before_action :require_user_owns_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    render :new
  end

  def create
    #must get a sub_id and user_id
    @post = current_user.posts.new(post_params)

    if @post.save
     redirect_to post_url(@post)
    else
     flash.now[:errors] = @post.errors.full_messages
     render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to posts_url
    else
      render :edit
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.nil?
      redirect_to subs_url
    else
      render :show
    end
  end

  # def index
  #   @posts = Post.all
  #   render :index
  # end

  def destroy
    post = Post.find(params[:id])
    sub_id = post.sub_id
    post.destroy
    redirect_to sub_url(sub_id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [] )
  end

  def require_user_owns_post
      #if you can find that sub_id in the list of the users subs, continue on
     return if current_user.posts.find_by(id: params[:id])
     render json: 'Forbidden', status: :forbidden
  end
end
