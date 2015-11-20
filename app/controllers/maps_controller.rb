class MapsController < ApplicationController
  def index
    @articles = Article.all.includes(:group)
  end
end
