class Admin::ArticlesController < ApplicationController
  layout "admin"

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
  	@article = Article.new
  end

  def create 
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path, notice: 'Article was successfully created.'
    else
      render :new
    end
  end
  def update
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

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:name, :title, :article, :member_id)
    end
end