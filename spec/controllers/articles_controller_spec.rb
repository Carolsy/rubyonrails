require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "#index" do
    context 'as a guest' do
      it 'returns success' do
        get :index
        expect(response).to be_success
      end
    end
  end

  describe "#create" do
    before do
      @user = FactoryBot.create(:user)
      @article = FactoryBot.build(:article)
    end

    context "as a logged-in user" do
      it "adds an article" do
        #sign_in @user
        article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
        expect { post :create, params: { article: article_params } }.to change(@user.articles, :count).by(0)
      end

    end

    context "as a guest" do
      it "redirects to login path" do
        article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
        post :create, params: { article: article_params }
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "#edit" do
    before do
      @user = FactoryBot.create(:user)
      @article = FactoryBot.create(:article)
    end

    context "as a guest" do
      it "redirect to login path" do
        article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
        get :edit, params: { id: @article.id, user_id: article_params[:user_id] }
        expect(response).to redirect_to login_path
      end
    end

    context "as an another user" do
      before do
        @another_user = User.new(id: 11, username: "lalala", email: "lalala@qq.com", password: "lalala")
      end

      it "redirect to login path" do
        article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
        get :edit, params: { id: @article.id, user_id: @another_user.id }
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "#destroy" do
    context "as a guest" do
      before do
        @user = FactoryBot.create(:user)
        @article = FactoryBot.create(:article)
      end

      it "gets redirect" do
        article_params = FactoryBot.attributes_for(:article).merge(user_id: @user.id)
        @articles = Article.all
        delete :destroy, params: { id: @article.id }
        expect(response).to have_http_status(302)
      end
    end
  end

end
