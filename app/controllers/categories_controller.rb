class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @page_title = 'Categories'
    @css_sytle = 'main-blog-title'
    @categories = Category.all
    @posts = @category.posts
  end
end
