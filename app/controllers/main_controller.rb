class MainController < ApplicationController
  def index
    @articles = OriginArticle.order("publication_date DESC").where("publication_date <= ? and publication = ?", Date.today, true).includes(:group).includes(:genre).first(6)
  end

  # before_action do
  #   case request.user_agent
  #   when /iPad/
  #       request.variant = :tablet
  #     when /iPhone/
  #       request.variant = :mobile
  #   end
  # end
end
