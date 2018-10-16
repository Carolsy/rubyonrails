class FlowersController < ApplicationController
  def show
    @flower = Flower.find(2)
    @flower_articles = @flower.articles.all
  end
end
