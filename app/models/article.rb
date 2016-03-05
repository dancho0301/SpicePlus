class Article < OriginArticle
  extend ActiveHash::Associations::ActiveRecordExtensions

  before_save :check_plan_exists, :check_recommend_exists

  has_many :reports
  has_many :article_plans
  accepts_nested_attributes_for :article_plans, allow_destroy: true
  has_many :article_schedules
  accepts_nested_attributes_for :article_schedules, allow_destroy: true
  has_many :article_recommends
  accepts_nested_attributes_for :article_recommends, allow_destroy: true

  # 20150929
  # has_many :article_favirites
  # accepts_nested_attributes_for :article_favirites, allow_destroy: true

  belongs_to :area
  # belongs_to :genre
  belongs_to :group
  belongs_to :line
  belongs_to :spice

  # # バリデータ
  # validates :title , presence: true
  # validates :title, length: {maximum: 20, too_long: "タイトルは20文字以内にしてください"}
  # validates :article, presence: true
  # validates :publication_date, presence: true
  # validates :description, presence: true
  # validates :description, length: {maximum: 200, too_long: "説明は200文字以内にしてください"}
  validates :genre_id, presence: true
  validates :area_id, presence: true
  validates :group_id, presence: true
  validates :spice_id, presence: true
  # validates :photo, presence: true

  # geocoding
  # geocoded_by :address, :latitude, :longitude
  geocoded_by :address
  # before_validation :geocode
  after_validation :geocode

  def validate
    puts self.article_plans.count
    if self.article_plans.count > 3
      errors.add_to_base('スケジュールは３件以内としてください')
    end
  end

  # OriginArticleに移動
  # imageをattachファイルとする。stylesで画像サイズを定義できる
  # TODO 画像をトリミングする
  # has_attached_file :photo,
  #   styles: { top: "800x", medium: "450x450>", thumb: "300x100>" },
  #   :path => ":rails_root/public/system/:class/:attachment/:id/:style.:extension",
  #   :url => "/system/:class/:attachment/:id/:style.:extension"
  #
  # ファイルの拡張子を指定（これがないとエラーが発生する）
  # validates_attachment :photo,
  #   content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  #TODO 画像サイズは横800px以上とすること

  # OriginArticleに移動
  # def article=(html)
  #   # img タグが存在する場合
  #   if html =~ /\<img .+\>/
  #     # class="img-responsive" が設定されているか確認し、なければ追加する
  #     html.gsub!('class="img-responsive"', '')
  #     html.gsub!(/\<img /, '<img class="img-responsive" ')
  #   end
  #   write_attribute(:article, html)
  #   self
  # end

  def main_reporter
    self.reports.where("main_reporter = 1").first
  end

  # 緯度経度情報を取得する
  def address
    if self.group.present?
      self.group.address
    end
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
    # おすすめポイントの存在を確認。空白行は削除する
    def check_recommend_exists
      self.article_recommends.each do |recommend|
        if recommend.description.empty?
            recommend.destroy!
        end
      end
    end
end
