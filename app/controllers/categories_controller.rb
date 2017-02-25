class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @blog_title = '{ "blog": { "by": "TROYleach" } }'
    @page_title = @category.name
    @css_sytle = 'category-title'
    @categories = Category.all
    @posts = @category.posts
  end
end
