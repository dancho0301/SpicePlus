class OtherArticlesController < ApplicationController

  before_action :set_article, only: [:show]
  # before_action :set_articles, only: [:show, :index]
  # before_action :set_search, only: [:show, :index]

  # 記事一覧
  # def index
  #   @articles = @search.result\
  #     .order("publication_date DESC")\
  #     .where("publication_date <= ? and publication = ?", Date.today, true)\
  #     .includes(:group).includes(:genre)
  # end

  # 記事
  # サイドバーには表示中の記事以外を表示する
  def show
    # @all_articles = OtherArticle.where.not(id: params[:id]).order("publication_date DESC").where("publication_date <= ? and publication = ?", Date.today, true).includes(:genre)
    @other_articles = Article.where\
      .not(id: params[:id])\
      .order("publication_date DESC")\
      .where("publication_date <= ? and publication = ?", Date.today, true)\
      .limit(10)\
      .includes(:genre)

    # いいね（reputation） 20150930
    @reputation = Array.new
    3.times do |reputation_genre_id|
      @reputation[reputation_genre_id] = ArticleReputation\
        .where("article_id = ? and reputation_genre_id = ?", params[:id], reputation_genre_id)\
        .count
    end
  end

  # いいね
  def like
    @article_reputation = ArticleReputation\
      .create(article_id: params[:id], reputation_genre_id: params[:genre])
    render :json => {count: ArticleReputation\
      .where("article_id = ? and reputation_genre_id = ?", params[:id], params[:genre])\
      .count\
    }
  end

  private
    # def set_articles
    #   @all_articles = OtherArticle.all
    # end

    def set_article
      @article = OtherArticle.find(params[:id])
    end

    # def set_search
    #   @search = OtherArticle.search(params[:q])
    # end

    # 記事に利用されている地域だけ抽出する（検索で利用するため）
    # def set_used_area
    #   @used_areas = Area.find_by_sql("select * from areas a where exists (select 1 from articles b where a.id = b.area_id)")
    # end
end
