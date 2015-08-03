class Admin::InquiryController < ApplicationController
  layout "admin"
  before_action :set_inquiry, only: [:show]
  before_filter :require_login

  def index
    @inquiries = Inquiry.all.order("id DESC")
  end

  def show
  end

  private
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end
end
