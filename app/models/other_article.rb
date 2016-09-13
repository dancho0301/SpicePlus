class OtherArticle < OriginArticle
  before_save :set_default_values

  has_attached_file :reporter_photo,
    styles: { thumb: "100x100>" },
    :path => ":rails_root/public/system/:class/:attachment/:id/:style.:extension",
    :url => "/system/:class/:attachment/:id/:style.:extension"

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :reporter_photo,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  private
    def set_default_values
      self.genre_id = 0
    end
end
