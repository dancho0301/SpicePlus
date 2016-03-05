class Admin::ArticlesController < ApplicationController
  layout "admin"

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_collections, only: [:new, :edit]
  before_filter :require_login

  def index
    @articles = Article.all.order("publication_date DESC").includes([:group, reports: :spice])
  end

  def show
  end

  def new
  	@article = Article.new
    @article.article_schedules.build
    3.times do
      @article.article_plans.build
      @article.article_recommends.build
    end
  end

  def edit
    (3 - @article.article_plans.count).times do
      @article.article_plans.build
    end
    (3 - @article.article_recommends.count).times do
      @article.article_recommends.build
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_path, notice: '記事が作成されました'
    else
      set_collections
      render :new
    end
  end

  def update
    # p article_params
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: '記事が更新されました'
    else
      set_collections
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: '記事が削除されました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_genre
      @genres = Genre.all
    end

    def set_area
      @areas = Area.all
    end

    def set_group
      @groups = Group.all
    end

    def set_collections
      @genres = Genre.where.not(id: 0)
      @areas = Area.all
      @groups = Group.all.order("id DESC")
      @spices = Spice.all
    end

    # def set_schedule_form
    #   10.times do
    #     schedule = ArticleSchedule.new
    #     @article.article_schedules << schedule
    #   end
    # end


    # Only allow a trusted parameter "white list" through.
    def article_params
      # params.require(:article).permit(:name, :title, :article, :photo, :genre_id, :group_id, :publication_date, :description, :area_id, :article_schedules_attributes)
      params.require(:article).permit!
    end
end
