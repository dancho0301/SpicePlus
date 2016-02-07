class Group < ActiveRecord::Base
  has_many :articles

  before_save :update_article_locations

  validates :name,
    presence: true,
    length: {maximum: 30}

  validates :master_name,
    length: {maximum: 10}

  validates :tel,
    length: {maximum: 12}
    # ,format: { with: /^0\d$/}
    #TODO 電話番号の正規表現確認する

  # validates :mail, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  # 住所が更新されたら、記事の緯度経度情報も更新する

  private
    def update_article_locations
      if address_changed?
        Article.where(group_id: self.id).each do |article|
          article.save!
        end
      end
    end
end
