class Admin::PostsController < Admin::ApplicationController
  before_filter :verify_logged_in

  def new
    @page_title = 'Add Post'
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if params[:post][:image].blank?
      @post.image = nil
    end

    if @post.save
      flash[:success] = 'Post Created'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def edit
    @page_title = 'Edit Post'
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post Updated'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = 'Post Deleted'
    redirect_to admin_posts_path
  end

  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    else
      @posts = Post.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    end
    @page_title = 'All the Post'
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :image, :body, :delete_image)
  end
end
