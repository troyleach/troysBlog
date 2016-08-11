class Admin::CategoriesController < Admin::ApplicationController
  before_filter :verify_logged_in

  def new
    @page_title = 'Add Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category Created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @page_title = 'Edit Category'
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = 'Category Updated'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
      flash[:danger] = 'Category Deleted'
      redirect_to admin_categories_path
  end

  def index
    if params[:search]
      @categories = Category.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    else
      @categories = Category.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    end
    @page_title = 'All the Categories'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
