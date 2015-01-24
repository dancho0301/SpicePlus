class ArticleImage < ActiveRecord::Base


  # imageをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
    :url => "/system/:attachment/:id/:style.:extension"

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


  def file
    Paperclip.io_adapters.for(image)
  end

  def url(style = "")
    # image.path(style)
    image.url(style)
  end
end
