class AllArticle < ActiveRecord::Base

  belongs_to :genre
  belongs_to :group
  # has_many :reports, primary_key: "article_id"

  def self.get_classname
    if self.genre_id == 0
      classname = "other_articles"
    else
      classname = "articles"
    end
  end

  def main_reporter
    if self.genre_id != 0
      reporter = Report.where("article_id = ? and main_reporter = 1", self.id).first
      # self.reports.where("main_reporter = 1").first
    end
  end

  # imageをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :photo,
    styles: { top: "800x", medium: "450x450>", thumb: "300x100>" },
    :path => ":rails_root/public/system/:class/:attachment/:id/:style.:extension",
    :url => "/system/:class/:attachment/:id/:style.:extension"
end
