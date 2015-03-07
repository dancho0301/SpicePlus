class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]
  # before_action :set_articles, only: [:show, :index]
  before_action :set_search, only: [:show, :index]
  before_action :set_used_area, only: [:show, :index]

  # 記事一覧
  def index
    @articles = @search.result.order("publication_date DESC")
  end

  # 記事
  # サイドバーには表示中の記事以外を表示する
  def show
    @all_articles = Article.where.not(id: params[:id])
  end

  private
    # def set_articles
    #   @all_articles = Article.all
    # end

    def set_article
      @article = Article.find(params[:id])
    end


    def set_search
      @search = Article.search(params[:q])
    end

    # 記事に利用されている地域だけ抽出する（検索で利用するため）
    def set_used_area
      @used_areas = Area.find_by_sql("select * from areas a where exists (select 1 from articles b where a.id = b.area_id)")
    end
end
