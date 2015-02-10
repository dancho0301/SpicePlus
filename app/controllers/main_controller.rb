class MainController < ApplicationController
  def index
    @articles = Article.first(5)
  end
end
