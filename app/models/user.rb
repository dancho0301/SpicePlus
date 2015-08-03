class User < ActiveRecord::Base
  authenticates_with_sorcery!

  # attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of :username
  validates :username, length: {maximum: 10}

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }



  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

end
