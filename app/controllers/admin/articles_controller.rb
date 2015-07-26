class Admin::ArticlesController < ApplicationController
  layout "admin"

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  before_action :set_group, only: [:new, :edit]
  before_action :set_genre, only: [:new, :edit]
  before_action :set_area, only: [:new, :edit]

  def index
    @articles = Article.all.order("publication_date DESC")
  end

  def show
  end

  def new
  	@article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path, notice: '記事が作成されました'
    else
      render :new
    end
  end

  def update
    p article_params
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: '記事が更新されました'
    else
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

    def set_schedule_form
      10.times do
        schedule = ArticleSchedule.new
        @article.article_schedules << schedule
      end
    end


    # Only allow a trusted parameter "white list" through.
    def article_params
      # params.require(:article).permit(:name, :title, :article, :photo, :genre_id, :group_id, :publication_date, :discription, :area_id, :article_schedules_attributes)
      params.require(:article).permit!
    end
end
