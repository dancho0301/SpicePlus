class MainController < ApplicationController
  def index
    @articles = Article.order("publication_date DESC").first(6)
  end
end
