class Article < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :article_images
  has_many :reports

  belongs_to :line
  belongs_to :genre
  belongs_to :area
  belongs_to :group

  # imageをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :photo,
    styles: { top: "848x424>", medium: "450x450>", thumb: "300x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
    :url => "/system/:attachment/:id/:style.:extension"

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
