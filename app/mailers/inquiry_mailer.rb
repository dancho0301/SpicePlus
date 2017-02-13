class InquiryMailer < ActionMailer::Base
  default from: "spice@spice-plus.yokohama"           # 送信元アドレス
  default to: "spice@actionport-yokohama.org"         # 送信先アドレス
  default bcc: "samuraimania.d@gmail.com"             # BCC
  # 管理者全員にメールを送信する 2015/09/06 @dancho
  default bcc: User.where("administrator = ?", true).uniq.pluck(:email)


  def received_email(inquiry)
    @inquiry = inquiry
    @article = Article.find_by_id(inquiry.article_id)
    mail(:subject => 'お問い合わせを承りました')
  end

end
