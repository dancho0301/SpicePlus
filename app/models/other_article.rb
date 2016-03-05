class OtherArticle < OriginArticle
  before_save :set_default_values

  private
    def set_default_values
      self.genre_id = 0
    end
end
