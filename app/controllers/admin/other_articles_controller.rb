class Admin::OtherArticlesController < ApplicationController
  layout "admin"

  before_filter :require_login
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = OtherArticle.all.order("publication_date DESC")
  end

  def show
  end

  def new
    @article = OtherArticle.new
  end

  def edit
  end

  def create
    @article = OtherArticle.new(article_params)
    if @article.save
      redirect_to admin_other_articles_path, notice: '記事が作成されました'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_other_articles_path, notice: '記事が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_other_articles_path, notice: '記事が削除されました'
  end

  private
    def set_article
      @article = OtherArticle.find(params[:id])
    end

    def article_params
      params.require(:other_article).permit!
    end
end
