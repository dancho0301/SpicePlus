class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render :action => "index"
  end

  def confirm
    # 入力値のチェック
    attr = params.require(:inquiry).permit(:first_name, :family_name,:first_name_kana, :family_name_kana, :email, :message)
    @inquiry = Inquiry.new(attr)
    if @inquiry.valid?
      # OK 確認画面を表示
      render :action => 'confirm'
    else
      # NG 入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    # メール送信
    attr = params.require(:inquiry).permit(:first_name, :family_name,:first_name_kana, :family_name_kana, :email, :message)
    @inquiry = Inquiry.new(attr)

    InquiryMailer.received_email(@inquiry).deliver

    # 完了画面を表示
    render :action => 'thanks'
  end

end
