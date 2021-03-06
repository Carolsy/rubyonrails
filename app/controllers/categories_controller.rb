class CategoriesController < ApplicationController

  before_action :require_admin, except: %i[index show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'categoryをcreateできました！'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:danger] = 'Only admins can perform that action!'
      redirect_to categories_path
    end
  end

end
