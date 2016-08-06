class PostsController < ApplicationController
  def index
    @page_title = '{ blog: { "by": "TROYleach" } }'
    @css_sytle = 'main-page-title'
  end

  def show
    @page_title = 'Ruby ON the Rails'
    @css_sytle = 'main-blog-title'
  end
end
