class MainController < ApplicationController
  def index
    @articles = Article.order("publication_date DESC").first(5)
  end
end
