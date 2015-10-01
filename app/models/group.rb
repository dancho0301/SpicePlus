class Group < ActiveRecord::Base
  has_many :articles

  validates :name,
    presence: true,
    length: {maximum: 30}

  validates :master_name,
    length: {maximum: 10}

  validates :tel,
    length: {maximum: 12}
    # ,format: { with: /^0\d$/}
    #TODO 電話番号の正規表現確認する

  validates :mail, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

end
