class Admin::ReportsController < ApplicationController
  layout "admin"
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :set_spice, only: [:edit, :new]

  # GET /reports
  # def index
  #   @articles = Article.all.order("publication_date DESC")
  # end

  # GET /reports/1
  # def show
  # end

  def new
    @article = Article.find params[:article_id]
    @report = @article.reports.build
    puts "********* #{params}"
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to admin_articles_path, notice: 'レポートが作成されました'
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to admin_articles_path, notice: 'レポートが変更されました'
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to admin_articles_path, notice: 'レポートが削除されました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    def set_spice
      @spices = Spice.all
    end

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:article_id, :name, :title, :report_date, :report_body, :signature, :spice_id)
    end
end
