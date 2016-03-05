class Genre < ActiveRecord::Base
  has_many :origin_articles
end
