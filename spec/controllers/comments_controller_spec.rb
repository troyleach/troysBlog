require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    # need to set the below bc of the method :back in teh create action
    @request.env['HTTP_REFERER'] = 'http://test.com'
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before(:each) do
      user = create(:user)
      category = create(:category)
      @post = create(:post,
                     category_id: category.id)
      @comment = create(:comment)
      @params = {
                  name: 'bob baker',
                  email: 'bob@email.com',
                  body: 'this is the body of the announcement',
                }
    end

    it "expect to create a new user and a comment" do
      post :create, post_id: @post.id, comment: @params
      comment = Comment.all
      user = User.all
      bob = User.find_by_name('bob baker')

      expect(comment.length).to eq(2)
      expect(user.length).to eq(2)
      expect(bob.name).to eq('bob baker')
      expect(flash[:notice]).to eq("Your comment was successfully posted!")
      expect(controller).to redirect_to('http://test.com')
    end

    it "expect to create a comment" do
      post :create, post_id: @post.id, comment: @params
      comment = Comment.all
      expect(comment.length).to eq(2)
      expect(flash[:notice]).to eq("Your comment was successfully posted!")
      expect(controller).to redirect_to('http://test.com')
    end

    it "expect to create a sub-comment" do
      post :create, comment_id: @comment.id, comment: @params
      comments = Comment.all
      expect(comments.last.commentable_id).to eq(comments.first.id)
      expect(flash[:notice]).to eq("Your comment was successfully posted!")
      expect(controller).to redirect_to('http://test.com')
    end

  end
end
