class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    # @post = Post.find(params[:post_id])
    @comment = @commentable.comments.new comment_params

    if @comment.save!
      redirect_to :back, notice: "Your comment was successfully posted!"
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
    # @comment = @post.comments.create(comment_params)

    # redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end

  def authenticate_user
     
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end

end
