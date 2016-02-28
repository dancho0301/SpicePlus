class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render :action => "index"
  end

  def article
    @article = OriginArticle.find(params[:article_id])
    @inquiry = Inquiry.new
    render :action => "index"
  end

  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    @article = OriginArticle.find_by_id(inquiry_params[:article_id])

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
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      InquiryMailer.received_email(@inquiry).deliver
      # 完了画面を表示
      render :action => 'thanks'
    else
      render nothing: true, status: 500
    end
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:first_name, :family_name,:first_name_kana, :family_name_kana, :email, :message, :article_id)
    end

end
