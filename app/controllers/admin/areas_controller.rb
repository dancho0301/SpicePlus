class Admin::AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_filter :require_login

  layout "admin"

  # GET /admin/areas
  def index
    @areas = Area.all
  end

  # GET /admin/areas/1
  def show
  end

  # GET /admin/areas/new
  def new
    @area = Area.new
  end

  # GET /admin/areas/1/edit
  def edit
  end

  # POST /admin/areas
  def create
    @area = Area.new(area_params)

    if @area.save
      redirect_to [:admin, @area], notice: 'Area was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/areas/1
  def update
    if @area.update(area_params)
      redirect_to [:admin, @area], notice: 'Area was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/areas/1
  def destroy
    @area.destroy
    redirect_to admin_areas_url, notice: 'Area was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_params
      params.require(:area).permit(:name)
    end
end
