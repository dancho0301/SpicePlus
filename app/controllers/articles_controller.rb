class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]
  before_action :set_articles, only: [:show, :index]


  # 記事一覧
  def index
    @articles = @all_articles
  end

  # 記事
  def show
  end

  private
    def set_articles
      @all_articles = Article.all
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
