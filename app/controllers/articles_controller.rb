class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: '创建成功' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    #     @article.destroy
    #     respond_to do |format|
    #       format.html { redirect_to articles_url, notice: '删除成功.' }
    #       format.json { head :no_content }
    #     end
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = '删除成功'
    redirect_to articles_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
