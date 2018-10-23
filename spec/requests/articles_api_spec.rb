require 'rails_helper'

RSpec.describe "ArticlesApis", type: :request do
  describe "GET /articles_apis" do
    before do
      @user = FactoryBot.create(:user)
      @article = FactoryBot.create(:article)
    end

    it "works!" do
      get articles_path
      expect(response).to have_http_status(200)
    end


    it "redirects to login path" do
      article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
      get edit_article_path(@article.id), params: {
         id: @article.id,
         article: article_params
      }
      expect(response).to redirect_to(login_path)
    end

    it "adds a new article" do
      article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
      expect {
        post articles_path,
        params: { article_params: article_params }
      }.to change(@user.articles, :count).by(1)

    end

    it "redirects to login path" do
      article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
      get new_article_path, params: { article_params: article_params }
      expect(response).to redirect_to(login_path)
    end

    it "edits a given article" do
      @new_article = Article.new(title: "newtitle", description: "newdes")
      article_params = FactoryBot.attributes_for(:article).merge(title: @new_article.title, description: @new_article.description)
      get edit_article_path(@article.id), params: { params: article_params }
      #expect(response).to have_http_status(200)
      expect(response).to redirect_to login_path
    end

    it "deletes a given article" do
      @new_article = Article.new(title: "newtitle", description: "newdes")
      article_params = FactoryBot.attributes_for(:article).merge(title: @new_article.title, description: @new_article.description)
      expect{
        delete article_path(@article.id),
        params: { params: article_params}
      }.to change(Article, :count).by(-1)
    end
  end
end
