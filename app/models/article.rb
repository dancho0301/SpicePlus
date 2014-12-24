class Article < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :article_images

  belongs_to :line
  belongs_to :genre
  belongs_to :area

  # imageをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :photo,
    styles: { top: "848x424>", medium: "300x300>" },
    :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
    :url => "/system/:attachment/:id/:style.:extension"

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }




end
