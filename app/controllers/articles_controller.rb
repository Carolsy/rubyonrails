class ArticlesController < ApplicationController

  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    #reset_session
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "保存しました!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "変更しました!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "消しました!"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end
