class MainController < ApplicationController
  def index
    @articles = Article.order("publication_date DESC").where("publication_date <= ?", Date.today).first(6)
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
