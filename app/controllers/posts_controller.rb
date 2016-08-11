class PostsController < ApplicationController
  include PostsHelper

  def index
    # this is not going to work yet bc I have this set up diff. I need to rredirect to a diff page
    
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").paginate(:per_page => 10, :page => params[:page])
    else
      @posts = Post.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    end
    @categories = Category.all
    posts = Post.all
    @page_title = '{ "blog": { "by": "TROYleach" } }'
    @css_sytle = 'main-page-title'
    @categories = Category.all
    @main_blog = get_current_blog(posts)
    @group_of_blogs = get_four_random_blogs(posts)
  end

  def show
    @blog = Post.find_by_id(params[:id])
    @page_title = @blog.category.name
    @css_sytle = 'main-blog-title'
    @comment = Comment.new
    @comments = Comment.all
  end
end
