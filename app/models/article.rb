class Article < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  before_save :check_plan_exists

  has_many :article_images
  has_many :reports
  has_many :article_plans
  accepts_nested_attributes_for :article_plans, allow_destroy: true
  has_many :article_schedules
  accepts_nested_attributes_for :article_schedules, allow_destroy: true
  has_many :article_recommends

  belongs_to :line
  belongs_to :genre
  belongs_to :area
  belongs_to :group

  # imageをattachファイルとする。stylesで画像サイズを定義できる
  # TODO 画像をトリミングする
  has_attached_file :photo,
    styles: { top: "800x", medium: "450x450>", thumb: "300x100>" },
    :path => ":rails_root/public/system/:class/:attachment/:id/:style.:extension",
    :url => "/system/:class/:attachment/:id/:style.:extension"

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

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

  def main_reporter
    self.reports.where("main_reporter = 1").first
  end

  private
    # プランの存在を確認。空白行は削除する
    def check_plan_exists
      self.article_plans.each do |plan|
        if plan.title.empty? && plan.description.empty?
            plan.destroy!
        end
      end
    end

end
