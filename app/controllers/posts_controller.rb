class PostsController < ApplicationController
  include PostsHelper

  def index
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
  end
end
