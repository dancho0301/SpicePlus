class Admin::ArticleImagesController < ApplicationController

  # article_image/create
  def create
    @article_image = ArticleImage.new(params.require(:article_image).permit(:image))
#    puts current_user
#    @article_image.article_id = current_user.venue.article.id
    if @article_image.save
      # debug
      # puts "★Debug: #{@article_image.url('medium')}"
      render json: {url: @article_image.url("medium")}, status: 200
    else
      render nothing: true, status: 500
    end
  end

end
