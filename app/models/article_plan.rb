class ArticlePlan < ActiveRecord::Base
  # :id
  # :article_id
  # :title
  # :description
  # :color_theme

  # 必須チェックすると通らなくなる
  # validates_presence_of :article_id
  # validates_presence_of :title
  # validates_presence_of :description

  # 同一記事のプランが３つ以内であること


end
