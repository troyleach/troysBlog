class CommentsController < ApplicationController
  include ApplicationHelper

  before_action :find_commentable
  before_action :authenticate_user, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_to :back, notice: "Your comment was successfully posted!"
    else
      @errors = @comment.errors.messages
      error_message = @errors.map { |k, v| "#{k} #{v[0]}" }.to_sentence
      redirect_to :back, alert: "Your comment did not save - #{error_message}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end

  def authenticate_user
    commentor = User.find_by_email(params[:comment][:email])
    if commentor.present?
      return
    else
      pass = generate_password
      commentor = User.new(name: params[:comment][:name], email: params[:comment][:email], password: pass)

      if commentor.save!
        return
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
    end

  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end

end
