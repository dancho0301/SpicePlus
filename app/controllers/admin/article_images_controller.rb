class Admin::ArticleImagesController < ApplicationController
  layout "admin"

  before_action :set_article_image, only: [:show, :edit, :update, :destroy]

  # article_image/create
  def create
    @article_image = ArticleImage.new(article_image_params)
#    puts current_user
#    @article_image.article_id = current_user.venue.article.id
    if @article_image.save
      # debug
      # puts "★Debug: #{@article_image.url('medium')}"

      # Summernoteに直接画像アップしていた時代の遺産
      # render json: {url: @article_image.url("medium")}, status: 200
      redirect_to admin_article_images_path, notice: "画像が登録されました"
    else
      render nothing: true, status: 500
    end
  end

  def update
    if @article_image.update(article_image_params)
      redirect_to admin_article_images_path, notice: '画像が登録されました'
    else
      render :edit
    end
  end

  def destroy
    @article_image.destroy
    redirect_to admin_article_images_path, notice: '画像が削除されました'
  end

  def index
    @article_images = ArticleImage.all
  end

  def new
    @article_image = ArticleImage.new
  end

  private
    def set_article_image
      @article_image = ArticleImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_image_params
      params.require(:article_image).permit(:title, :discription, :image)
    end
end
