class StaticPagesController < ApplicationController
  before_action :set_search
  before_action :set_used_area
  before_action :set_all_articles

  def about
  end

  def recruitment
  end


  private
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

    def set_all_articles
      @all_articles = Article.all
    end

end
