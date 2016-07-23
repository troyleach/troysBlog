class PostsController < ApplicationController
  def index
    @page_title = '{ blog: { "by": "TROYleach" } }'
    @css_sytle = 'main-page-title'
  end

  def show
  end
end
