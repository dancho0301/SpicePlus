class Area < ActiveRecord::Base
  has_many :articles

  validates_presence_of :name
  validates :name, length: {maximum: 10}        # 値が「2文字以上」であれば有効

end
