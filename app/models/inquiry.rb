class Inquiry < ActiveRecord::Base

  # attr_accessor :first_name, :family_name,:first_name_kana, :family_name_kana, :email, :message, :article_id

  belongs_to :article

  validates :first_name, :presence => {:message => '名を入力してください'}
  validates :family_name, :presence => {:message => '姓を入力してください'}
  # validates :first_name_kana, :presence => {:message => 'メイを入力してください'}
  # validates :family_name_kana, :presence => {:message => 'セイを入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
end
