class OriginArticle < ActiveRecord::Base
  belongs_to :genre
  belongs_to :group

  def main_reporter
    if self.genre_id != 0
      reporter = Report.where("article_id = ? and main_reporter = 1", self.id).first
      # self.reports.where("main_reporter = 1").first
    end
  end

  # imageをattachファイルとする。stylesで画像サイズを定義できる
  # TODO 画像をトリミングする
  has_attached_file :photo,
    styles: { top: "800x", medium: "450x450>", thumb: "300x100>" },
    :path => ":rails_root/public/system/:class/:attachment/:id/:style.:extension",
    :url => "/system/:class/:attachment/:id/:style.:extension"

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  # バリデータ
  validates :title , presence: true
  validates :title, length: {maximum: 20, too_long: "タイトルは20文字以内にしてください"}
  validates :article, presence: true
  validates :publication_date, presence: true
  validates :description, presence: true
  validates :description, length: {maximum: 200, too_long: "説明は200文字以内にしてください"}
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode

  def article=(html)
    # img タグが存在する場合
    if html =~ /\<img .+\>/
      # class="img-responsive" が設定されているか確認し、なければ追加する
      html.gsub!('class="img-responsive"', '')
      html.gsub!(/\<img /, '<img class="img-responsive" ')
    end
    write_attribute(:article, html)
    self
  end

end
